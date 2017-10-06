From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 22:31:52 +0200
Subject: [Buildroot] [next v2 1/7] testing/infra/builder: split
 configure() from build()
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <fb667fe0-7577-9d7b-5b7a-5e293d31a1c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I believe you might respin this series soonish, so time to review it :-)

 BTW, when you do respin, could you push it to a gitlab clone, trigger the
build, and report the result in your cover letter?

On 27-08-17 00:20, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Some test cases don't use a full build as setup, so split the build()
> method into configure() and build().
> It allows a test case to perform configuration at the setup stage and
> the build inside the test itself.
> 
> Call this new method just before build in the BRTest base class, to keep
> the current behavior for existing test cases.
> 
> This change will be needed when adding a common class to test the git
> download infra.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It would be nice though to have an example of its use earlier in the series.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - new patch to adapt the test infra to test git download
> ---
>  support/testing/infra/basetest.py | 1 +
>  support/testing/infra/builder.py  | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 431605b23f..d61f4d337b 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -57,6 +57,7 @@ class BRTest(unittest.TestCase):
>  
>          if not self.b.is_finished():
>              self.show_msg("Building")
> +            self.b.configure()
>              self.b.build()
>              self.show_msg("Building done")
>  
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index 905b127c91..e7c8e0102c 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -10,7 +10,7 @@ class Builder(object):
>          self.builddir = builddir
>          self.logfile = infra.open_log_file(builddir, "build", logtofile)
>  
> -    def build(self):
> +    def configure(self):
>          if not os.path.isdir(self.builddir):
>              os.makedirs(self.builddir)
>  
> @@ -29,6 +29,7 @@ class Builder(object):
>          if ret != 0:
>              raise SystemError("Cannot olddefconfig")
>  
> +    def build(self):
>          cmd = ["make", "-C", self.builddir]
>          ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
>          if ret != 0:
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
