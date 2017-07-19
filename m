From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Jul 2017 14:00:40 +0200
Subject: [Buildroot] [PATCHv3] support/tests: allow properly indented
	config fragment
In-Reply-To: <20170718203839.14913-1-yann.morin.1998@free.fr>
References: <20170718203839.14913-1-yann.morin.1998@free.fr>
Message-ID: <00f33a0e-da8e-3d36-ecad-c8b4d02450b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 22:38, Yann E. MORIN wrote:
> Currently, defining a config fragment in the runtime test infra requires
> that the fragment not to be indented. This is beark, and causes grievance
> when looking at the code (e.g. to fix it).
> 
> Just strip out all leading spaces/tabs when writing the configuration
> lines into the config file, allowing in-line indented config fragments,
> like so:
> 
>     class TestFoo(bla):
>         config = bla.config + \
>             """
>             FOO=y
>             # BAR is not set
>             """
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> Changes v2 -> v3:
>   - use and fix code snippet provided by Arnout, thanks! ;-)
>   - do it in our base test class, not on the builder class  (Arnout)
> 
> Changes v1 -> v2:
>   - add example in commit log  (Thomas)
> ---
>  support/testing/infra/basetest.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 1a082bb441..07c180e232 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -41,6 +41,7 @@ class BRTest(unittest.TestCase):
>          self.testname = self.__class__.__name__
>          self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
>          self.emulator = None
> +        self.config = '\n'.join([line.lstrip() for line in self.config.splitlines()])

 It would also be nice to move the setting of jlevel to the constructor. But
heck, there's probably a lot that would be nice to improve in the testing infra :-)

 Regards,
 Arnout

>  
>      def show_msg(self, msg):
>          print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
