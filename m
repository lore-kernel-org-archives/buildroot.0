From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 00:03:41 +0200
Subject: [Buildroot] Using packages overrides
In-Reply-To: <5704CC54.5080007@barix.com>
References: <5704CC54.5080007@barix.com>
Message-ID: <570587BD.9000907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/16 10:44, Aleksandar Simeonov wrote:
> Hi All,
>
> Could someone help me to understand how to use properly the package override in
> BR? I'm trying to override a BR package by defining the
> BR2_PACKAGE_OVERRIDE_FILE="$(BR2_EXTERNAL)/local.mk"
>
> and putting in local.mk the right
>
> PKGFOO_OVERRIDE_SRCDIR = $(BR2_EXTERNAL)/package/override/sysvinit
>
> The problem is that whatever package I try to override, the build complains that
> it has been redefined-once in the original BR2 package folder, and second time
> in the override folder. Am I misinterpreting the BR user manual chapter 8.12.6 ?
> Can we use Config.in and pkgfoo.mk files in the override folder, or we have to
> share those of the original package? That wouldn't make anysense, because the
> user may also need to customise the .mk file. What I'm missing/doing wrong ?

  The OVERRIDE_SRCDIR only overrides the source of the package, so it will skip 
the download, extract and patch steps. These steps are replaced with just 
copying the source from the OVERRIDE_SRCDIR to the build directory. The 
configure, build and install steps are still using the rules from the original 
package.

  OVERRIDE_SRCDIR is not really meant to make radical changes to a package that 
would require rewriting the .mk file. It is actually just meant for development 
to prepare package patches, which would finally be added as actual patches to 
either the package directory or GLOBAL_PATCH_DIR. That said, I do often (ab)use 
it myself for customising packages.


  If you do need to change the build system, another hack is that you can add 
pre- or post-configure, -build or -install hooks in $(BR2_EXTERNAL)/external.mk. 
You can also update some of the package variables there. But not all of them, 
for example _VERSION or _DEPENDENCIES cannot be overridden.

  It would indeed be nice if a package could be completely overridden in 
BR2_EXTERNAL, but at the moment that's not possible. It's not trivial to do that 
in the current architecture of the Buildroot infrastructure. I believe Yann had 
some ideas of how it could be done.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
