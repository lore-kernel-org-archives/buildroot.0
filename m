From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 08:15:23 +0100
Subject: [Buildroot] [RFC 00/15] Automatically produce legal compliance
	info
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <201201310815.24022.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 16:11:33 Luca Ceresoli wrote:
[snip]
>   $ make legal-info
>   busybox  1.19.3       GPL_V2_ONLY
>   bzip2    1.0.5        BSD
>   directfb 1.4.15       LGPL_V2.1
>   foobar   1.2.3.4      PROPRIETARY
>   freetype 2.4.8        unknown
>   iostat   2.2          GPL_V2

 Cool!

>   ...
>   $ cat output/legal-info/manifest.csv 
>   package,version,license
>   busybox,1.19.3,GPL_V2_ONLY
>   bzip2,1.0.5,BSD
>   directfb,1.4.15,LGPL_V2.1
>   foobar,1.2.3.4,PROPRIETARY
>   freetype,2.4.8,unknown
>   iostat,2.2,GPL_V2
>   ...

 Personally I'd have used tabs instead of commas, so it is still
human-readable.  Not sure how non-libreoffice spreadsheets deal with
that, though.

>   $ ls output/legal-info/sources/
>   autoconf-2.65.tar.bz2
>   automake-1.11.1.tar.bz2
>   binutils-2.21.1.tar.bz2
>   busybox-1.19.3.tar.bz2
>   bzip2-1.0.5.tar.gz
>   DirectFB-1.4.15.tar.gz
>   fakeroot_1.9.5.tar.gz
>   freetype-2.4.8.tar.bz2
>   ...

 I think these should be hardlinks instead of copies of the dl 
directory.  You can use 'cp -l', which I believe falls back to
actual copying if the target filesystem doesn't support hardlinks
(although I can't think of a filesystem that supports symlinks but
not hardlinks).

[snip]
> The implementation takes only ~35 lines of code so it should be simple to
> review.

 I'll try to do that the coming days.  Without Reviewed-by tag, since this 
is still RFC.

> 
> Now the long list of open issues.
> 
> The semantics of the _LICENSE variable is still non well defined.
> It might be a generic string (e.g. FOOBAR_LICENSE = modified 3-clause BSD),
> or one from a well-defined list of known licenses.
> The former interpretation is probably the more useful for producing a manifest
> file. The latter might be useful to help an automated implementation of the
> last goal listed above: save the complete text of all license files to a
> directory.

 I would pre-define a number of strings, for which a predefined license
text exists.  The packager should check if the license text is identical,
and attach 'dirty' or something to the name if not.


[snip]
> Copying the source tarball does not currently work for packages with
> _SITE_METHOD equal to local, as there is no tarball associated to it.
 That should be fixed for the final version.

> Other methods, such as file and all versioning systems, are not tested, but
> they should work as there's a tarball in the download dir.
> 
> Non-gentargets and non-autotargets packages are not tested. I guess they need
> a $(PKG)-legal-info target to be defined manually.
 Those packages should be converted anyway.


> It might be useful to remove the output/legal-info dir before populating it,
> to be sure there are no remnants of previous runs. It would not have a big
> additional cost, since the computations and copies must be done anyway.
 I agree.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
