From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 00:03:51 +0200
Subject: [Buildroot] Adding custom config files to a package
In-Reply-To: <570CF9E0.3000609@barix.com>
References: <570CF9E0.3000609@barix.com>
Message-ID: <570D70C7.6040805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 15:36, Aleksandar Simeonov wrote:
> Hi Gustavo,
>
> Sorry to disturb you again, but back to our discussion sometime ago on
> #buildroot IRC channel:
>
> Now I'm trying to implement your idea to use <pkg>_config files to copy some
> custom configuration target once the main package is built.
> The idea works great, however it has certain drawbacks - It is executed only the
> first time you build the main package, and then gets added to the rootfs.jffs
> image. As soon as I have the image built, any make runs after that do not rut
> through it, as if it is not detected as a dependency.

  Indeed, buildroot doesn't really support rebuilding. You can explicitly 
rebuild a single package with 'make foo-rebuild', but that doesn't force other 
packages that depend on it to be rebuilt.

  This is intentional, because the result of rebuilding individual packages is 
anyway somewhat unpredictable.


 > This is bit of a problem
> because when rebuilding the image (for this I clean the target folder before
> that), the make does not copy the <pkg> relevant files to the output/target
> folder, and thus not propagating them to the image :( Is there anything I can do
> about it?

  make clean; make

>
> I have tried adding a Config.in file, and source it in the main Config.in file
> in my BR2_EXTERNAL folder, but then the make tries to "compile" it, and fails
> with "No scheme" message.

  Sound like you specified a _SITE with a URL that doesn't start with http://


> I assume that do not need to run $(eval
> $(whatever-package)) at the end because it is not a real package, so commenting
> it solves the compilation error, but still is not run

  If you don't have a $(whatever-package) in your .mk file, nothing is done with it.

>
> Attached I'm sending an example for configuring dropbear package. In my main
> Config.in file I source this one, and the path to the makefile is included in my
> external.mk

  I think you attached the wrong files, the dropbear_config.mk is missing.


  Regards,
  Arnout

>
> Could you advise something in this case?
>
> Thank you very much in advance
>
> Alex
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
