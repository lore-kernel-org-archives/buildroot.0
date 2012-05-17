From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:06:26 +0200
Subject: [Buildroot] [PATCH v3 00/22] Automatically produce legal
 compliance info
In-Reply-To: <CAAXf6LXEQqxr4AhrmSTBnCRB4enScVHoWPD_LJwQL=0SGh+qzg@mail.gmail.com>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LXEQqxr4AhrmSTBnCRB4enScVHoWPD_LJwQL=0SGh+qzg@mail.gmail.com>
Message-ID: <4FB53012.2070601@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
thanks for reviewing these patches.

Thomas De Schampheleire wrote:
> Hi Luca,
...


> I pulled from your branch and did some tests with it. Some observations:
>
> - If you start from a clean env without .config, the 'legal-info'
> target does not exist. This is because it's in the 'have-config'
> block. This may make sense, but it would be nice if this were noted
> somewhere (the fact that you have to have a config first).

I reworded the manual this way:
>  To make this easier for you, Buildroot can collect for you some material you
>  will probably need. To produce this material, after you configured Buildroot
>  with +make menuconfig+, +make xconfig+ or +make gconfig+, run:


> - I then created a config, (either with a defconfig (I took pandaboard
> as example) or by just starting 'make menuconfig' and immediately
> saving) and executed 'make legal-info'. Now I got:
>
>>>> busybox 1.20.0 Downloading
> /home/tdescham/repo/contrib/buildroot-import/dl/busybox-1.20.0.tar.bz2:
> No such file or directory
> /home/tdescham/repo/contrib/buildroot-import/dl/busybox-1.20.0.tar.bz2:
> No such file or directory
> make: *** [/home/tdescham/repo/contrib/buildroot-import/output/build/busybox-1.20.0/.stamp_downloaded]
> Error 1
>
> This was fixed by explicitly running 'make dirs'. I think then that
> 'dirs' should be a prerequisite for the legal-info target.

Fixed in v4.

>
> - After that I played a bit by adding legal info to busybox and see
> how legal-info behaved. All was as expected, no comments here.
>
> - Then I tried specifying a proprietary package, and noticed that this
> is case-sensitive PROPRIETARY. Although I understand that this is
> easier, and I am not against keeping this, this fact was not mentioned
> in the docs. In fact, the common license list in usage.txt does not
> specify the PROPRIETARY license at all. I feel that we should mention
> this possibility at least somewhere, either in that using.txt place,
> or in the adding-packages-gentargets.txt file.

I added this to the list of licenses in using.txt:

-* +BSD-2c+: BSD 2-clause license.
+* +BSD-2c+: BSD 2-clause license;
+* +PROPRIETARY+: marks a non-opensource package;
+  Buildroot does not save any licensing info or source code for these packages.

and this to adding-packages-gentargets.txt:

  * +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
    is released.
    This name will appear in the manifest file produced by +make legal-info+.
    If the license is one of those listed in xref:legal-info[],
    use the same string to make the manifest file uniform.
    Otherwise, describe the license in a precise and concise way, avoiding
    ambiguous names such as +BSD+ which actually name a family of licenses.
+  If the root filesystem you generate contains non-opensource packages, you
+  can define their license as +PROPRIETARY+: Buildroot will not save any
+  licensing info or source code for this package.
    This variable is optional. If it is not defined, +unknown+ will appear in
    the +license+ field of the manifest file for this package.

Luca
