From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 20:50:17 +0200
Subject: [Buildroot] [PATCH v6] toolchain: add option to copy the gconv
 libraries
In-Reply-To: <1406489312-32491-1-git-send-email-yann.morin.1998@free.fr>
References: <1406489312-32491-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140728205017.540a2ce6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 27 Jul 2014 21:28:32 +0200, Yann E. MORIN wrote:
> The gconv libraries are used to translate between different character sets
> ('charsets', even 'csets' sometimes). Some packages need them to present
> text to the user (eg. XBMC Gotham).
> 
> In (e)glibc they are implemented by the internal implemenation of iconv,
> called gconv, and are provided as dlopen-able libraries.
> 
> Note that some gconv modules need extra libraries (shared by more than
> one gconv module), so we must, when adding a subset of modules, scan the
> installed modules in search of the missing libraries.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Eric Limpens <limpens@gmail.com>

Thanks, I've applied this version of the patch. I fixed the coding
style in the expunge-gconv-modules script, to make it match a more
normal coding style (i.e no space after opening parenthesis and before
closing parenthesis, space before/after operators, etc.).

Also, on the design principle, there are two things that will have to
fixed as followup patches:

 1/ The fact that the new options appear in the Toolchain menu. It's
    already a problem with the locale-related settings. I believe they
    are more "System setting" than "Toolchain settings".

 2/ The copy of the gconv modules should not be done as a target
    finalize hook (contrary to what I suggested earlier), but should
    actually be integrated as part of the package/glibc and
    toolchain/toolchain-external logic, so that those gconv modules are
    considered to be part of the toolchain (from a build/install time
    point of view, and also from a package size point of view in
    relation with my script graphing per-package size). There is no
    reason to have this installation as a target-finalize hook.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
