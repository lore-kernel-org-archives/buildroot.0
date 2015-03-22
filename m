From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:16:26 +0100
Subject: [Buildroot] [PATCH 1/7] linux: use the package infrastructure
 to download patches
In-Reply-To: <1425147313-17380-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EDCCA.7000607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> The linux package has a special handling of patches, with quite a bit
> of legacy in it. A problem caused by this special handling is that the
> linux package calls directly the DOWNLOAD_WGET macro, which means that
> the package infrastructure isn't aware of which patches get
> downloaded, and it prevents doing changes inside the package download
> infrastructure.
> 
> This commit changes the handling of patches in the linux package in
> the following way:
> 
>  * The LINUX_PATCHES variable is kept as is: it lists all the patches
>    mentionned in the Config.in option BR2_LINUX_KERNEL_PATCH. This
>    option can contain http://, ftp://, https:// URLs, path to local
>    files or local directories.
> 
>    This variable is *not* used by the generic package infrastructure,
>    so it is purely internal to the Linux package.
> 
>  * The LINUX_PATCH variable is now filled in with the list of patches
>    that should be downloaded. It is derived from LINUX_PATCHES by
>    filtering the patches that have http://, ftp:// or https:// in
>    their path. Since <pkg>_PATCH is handled by the package
>    infrastructure, it means that those patches are now automatically
>    downloaded and applied by the package infrastructure.
> 
>  * The LINUX_APPLY_PATCHES hook is renamed to
>    LINUX_APPLY_LOCAL_PATCHES, because it is now only responsible of
>    applying local patches: remote patches are handled by
>    LINUX_PATCH. The implementation of the hook is changed to filter
>    out the patches that have already taken care of by LINUX_PATCH, so
>    that we only iterate through the list of local patches or local
>    patch directories.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It's time for this one to be applied. There are of course the two spelling
corrections noted by Romain and Baruch, but I'm sure you can fix those while
applying.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
