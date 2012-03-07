From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Mar 2012 22:41:00 +0100
Subject: [Buildroot] [RFC v2 00/31] Automatically produce legal
	compliance info
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <201203072241.00945.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lucas, All,

On Wednesday 07 March 2012 21:58:00 Luca Ceresoli wrote:
> This second RFC incorporates many of the additions and modifications that have
> been discussed, as well as many other improvements. Thanks Arnout, ThomasDS and
> others for their review, and the BDD participants for their suggestions.

Woohoo, that's impressive! :-)

>   $ find legal-info/ -type f
>   legal-info/README            # Lists saved stuff, warns about unsaved
>   stuff legal-info/licenses.txt      # Text of all licenses
>   legal-info/buildroot.config  # The buildroot config
>   legal-info/licenses/buildroot/COPYING       # License files, one dir per
>   pkg legal-info/licenses/busybox/LICENSE         # ...
>   legal-info/licenses/...other packages...    # ...
>   legal-info/manifest.csv                     # CSV table summarizing all
>   info legal-info/sources/busybox-1.19.4.tar.bz2   # tarballs
>   legal-info/sources/kmod-5.tar.xz            # ...
>   legal-info/sources/libtool-2.2.10.tar.gz    # ...
>   legal-info/sources/...other packages...     # ...

I would expect a one-directory-pre-package layout (personal opinion):
  legal-info/busybox/LICENSE
  legal-info/busybox/busybox-1.19.4.tar.bz2
  legal-info/kmod/COPYING
  legal-info/kmod/kmod-5.tar.bz2
  ...

[--SNIP--]
> ISSUE 2: Packages with multiple licenses
> ========================================
> 
> Some packages (e.g. freetype, qt) allow to choose among different licenses.
> - Should we add an option in menuconfig for choosing the license? This would
>   allow to generate "customized" manifest and license files.
> - Or should we save all licenses and and define the package license as, for
>   instance:
>     QT_LICENSE = GPLv3 or LGPLv2.1 or COMMERCIAL?

It would probably be possible to do:
    QT_LICENSE = GPLv3
    ifeq ($(blabla),y)
    QT_LICENSE += LGPLv2.1
    endif

and so on...

> ISSUE 3: packages without a license file
> ========================================
> 
> Some packages (e.g. tslib) do not have a license file. Instead, the license is
> written in a comment at the top of one or more source files. In such cases we
> planned that the package maintainer would manually copy this text into a file
> in the package directory (where the .mk lives) and the teach the infrastructure
> where it is, so it gets copied from there.
> 
> I haven't started working on an implementation of this feature yet, but at
> first sight it's not totally trivial. The problem is the <PKG>_LICENSE_FILES
> definition as it is implemented in the present RFC does not easily allow to
> discriminate between a file in $(O)/build/<pkg>-<ver>/ and a file in
> packages/<pkg>/.
> 
> This is how it works now:
>         @cp $(addprefix $$($(2)_DIR)/,$$($(3)_LICENSE_FILES)) \
>                 $(LICENSE_FILES_DIR)/$$($(3)_NAME)/
> It assumes the files are in the package build dir, $(2)_DIR, which allows a
> very simple and clean implementation.
> 
> In order to support a copy from the package directory, option 1 is to define
> the full path in <PKG>_LICENSE_FILES, and remove the addprefix from the above
> code snipped. Example:
>   FOO_LICENSE_FILES = $(BUILD_DIR)/foo-$(FOO_VERSION)/COPYING
>   BAR_LICENSE_FILES = packages/bar/COPYING
> which is not very pleasant to read, and is quite error-prone for the developer
> adding a package.
> 
> Option 2 would be to have two distinct constants for the two cases:
>   FOO_LICENSE_FILES_IN_BUILD_DIR = COPYING
>   BAR_LICENSE_FILES_IN_PACKAGE_DIR = COPYING
> Even with better constant names this would not be extremely beautiful IMHO.
> 
> Option 3 is to wait for a smarter idea coming from your reviews! :)

Proposal:
  - FOO_LICENSE_FILES = list of license files
  - FOO_LICENSE_HOOK = macros to call to copy the license files

> TODO in the next patchset before merging into mainline
> ======================================================
> 
> - Add to the documentation:
>   - some words of advice from Buildroot developers about how to comply to GPL
>     and other open source licenses;
>   - brief instructions on using this stuff ('make legal-info');
>  - instructions in the GENTARGETS section about the _LICENSE and _LICENSE_FILES
>    constants.
> 
> - Write a few lines of explanation in the log message of the first big commit,
>   the one that implements all the logic.
> 
> - Save a defconfig instead of the whole .config for the Buildroot configuration?
>   Which one would you better like?

A full .config, from experiemce...

And what about the linux, uClibc and busybox .config files? Unless I missed
something in your email, you did not address these...

Thank you for doing this!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
