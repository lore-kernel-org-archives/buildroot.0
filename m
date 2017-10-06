From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 22:42:44 +0200
Subject: [Buildroot] [next v2 2/7] testing/infra/builder: build with
 target and environment
In-Reply-To: <20170826222056.6119-2-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-2-ricardo.martincoski@gmail.com>
Message-ID: <6455fdd0-c445-09cd-d249-ebfaf275c3fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-17 00:20, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Make the builder able to call 'VAR1=1 make VAR2=2 target'.
> 
> Allow to send extra parameters to be added to the end of make command
> line. It can be used for these purposes:
>  - to configure a br2-external, by passing 'BR2_EXTERNAL="dir"';
>  - to specify a make target, such as 'foo-source'.
> 
> Allow to add variables to the environment in which make runs. It can be
> used for these purposes:
>  - to override values from environment, such as 'BR2_DL_DIR="dl"';
>  - to set variables not set in the .mk files (for testing purpose), as
>    FOO_VERSION='1/1', triggering the preprocessing of values.
> 
> This change will be needed when adding a common class to test the git
> download infra.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> Changes v1 -> v2:
>   - new patch to adapt the test infra to test git download
> ---
>  support/testing/infra/builder.py | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index e7c8e0102c..de7c141a76 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -10,7 +10,12 @@ class Builder(object):
>          self.builddir = builddir
>          self.logfile = infra.open_log_file(builddir, "build", logtofile)
>  
> -    def configure(self):
> +    # Configure the build
> +    #
> +    # makecmdline: a list of arguments to be passed to the make command.
> +    # e.g. makecmdline=["BR2_EXTERNAL=/path"]
> +    #

 Better to do this as a docstring rather than a comment. And use the docstring
formatting as well.

> +    def configure(self, makecmdline=None):

 Maybe makecmdline -> make_extra_opts ?

 For symmetry, I'd add both make_extra_opts and make_extra_env here.

>          if not os.path.isdir(self.builddir):
>              os.makedirs(self.builddir)
>  
> @@ -22,16 +27,36 @@ class Builder(object):
>                             "> end defconfig\n")
>          self.logfile.flush()
>  
> -        cmd = ["make",
> -               "O={}".format(self.builddir),
> -               "olddefconfig"]
> +        cmd = ["make", "O={}".format(self.builddir)]
> +        if makecmdline:
> +            cmd += makecmdline

 This allows only a single options to be passed. I would require make_extra_opts
to be an iterable and do cmd.extend(make_extra_opts) here.

 Also, if you default it to () instead of None, you don't need the condition.

> +        cmd += ["olddefconfig"]
> +
>          ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
>          if ret != 0:
>              raise SystemError("Cannot olddefconfig")
>  
> -    def build(self):
> +    # Perform the build
> +    #
> +    # makecmdline: a list of arguments to be passed to the make command. It can
> +    # include a make target.
> +    # e.g. makecmdline=["foo-source"]
> +    #
> +    # env: a dict of variables to be appended (or replaced) in the environment
> +    # that calls make.
> +    # e.g. env={"BR2_DL_DIR": "/path"}
> +    #
> +    def build(self, makecmdline=None, env=None):

 env -> make_extra_env

> +        buildenv = os.environ.copy()
> +        if env:
> +            buildenv.update(env)
> +

 Here you could default make_extra_env to {} and do:

        env = os.environ.copy()
        env.update(make_extra_env)

 However, do we really want to keep the environment? Perhaps it's better to
start with an empty environment anyway...

 Regards,
 Arnout

>          cmd = ["make", "-C", self.builddir]
> -        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
> +        if makecmdline:
> +            cmd += makecmdline
> +
> +        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
> +                              env=buildenv)
>          if ret != 0:
>              raise SystemError("Build failed")
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
