From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 22:50:44 +0200
Subject: [Buildroot] [next v2 3/7] testing/infra/builder: allow to
 override logfile
In-Reply-To: <20170826222056.6119-3-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-3-ricardo.martincoski@gmail.com>
Message-ID: <30031227-952e-c7c0-cae1-f9e040d9b201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-17 00:20, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Some test cases can use only the configure step as setup, while the
> build is part of the test itself.
> Allow the caller to build() to override the logfile used. This way all
> the log for the actual test can be directed to *-run.log.

 This feels weird to me. If you need this kind of argument, then there is
something wrong with the logfile member of Builder.

 Your explanation here seems to suggest that the only reason to have this is to
split the -build and the -run logs so the -run logs contains something useful
for the git tests. I don't think that that's a good enough reason. What's wrong
with collecting all the output in the -build log?

 But looking at later patches, it looks like you're actually trying to solve a
problem here that a file is opened from two places and they run over each other.
If that is the case, I think a better solution needs to be found to handle the
log files. Could be as simple as the log file being maintained by the test class
itself, and passed as an argument to the Builder functions every time.

 Regards,
 Arnout

> 
> This change will be needed to make nice logs for git downloader test
> cases.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> Changes v1 -> v2:
>   - new patch to adapt the test infra to test git download
> ---
>  support/testing/infra/builder.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index de7c141a76..d634c211ac 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -46,7 +46,13 @@ class Builder(object):
>      # that calls make.
>      # e.g. env={"BR2_DL_DIR": "/path"}
>      #
> -    def build(self, makecmdline=None, env=None):
> +    # ovrdlogfile: when the build is part of the actual test case instead of
> +    # the setup, this parameter can be used to override the logfile used.
> +    # e.g. ovrdlogfile=handler_for_the_run_log
> +    #
> +    def build(self, makecmdline=None, env=None, ovrdlogfile=None):
> +        logfile = ovrdlogfile or self.logfile
> +
>          buildenv = os.environ.copy()
>          if env:
>              buildenv.update(env)
> @@ -55,7 +61,7 @@ class Builder(object):
>          if makecmdline:
>              cmd += makecmdline
>  
> -        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
> +        ret = subprocess.call(cmd, stdout=logfile, stderr=logfile,
>                                env=buildenv)
>          if ret != 0:
>              raise SystemError("Build failed")
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
