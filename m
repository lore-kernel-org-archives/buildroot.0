From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 8 Jul 2013 12:11:42 -0500
Subject: [Buildroot] [PATCH v3 2/2] qt: add powervr and opengl
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB6A579@DBDE04.ent.ti.com>
References: <1373217165-14521-1-git-send-email-spenser@gillilanding.com>
 <1373217165-14521-2-git-send-email-spenser@gillilanding.com>
 <321768C95D21724485BCE784F1BE98473EB6A448@DBDE04.ent.ti.com>
 <CAEBucnCNkD0VfqjgL7d3Rkt_+-wcj34BkZkLSO3cPRkXkm+v=A@mail.gmail.com>
 <321768C95D21724485BCE784F1BE98473EB6A579@DBDE04.ent.ti.com>
Message-ID: <CAEBucnC34wtUDkJm5_1OyjWxrnbJxh1bShM=Q=xuLxOGNop5Vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Prabu,

>>> >> - Can you also specify where the pvr2d.h and wsegl.h are picked up from (which Graphics SDK version) ?
>>> Ahh, this is something I missed while porting the patch. I'll have to look at this some more, these should be from the latest version.  I'll try to get qt to pick these up from $(STAGING_DIR)/usr/include .
>
>
> Thinking more on the above - Is it not possible to pick up the pvr2d.h and wsegl.h from the version of Graphics package used for building Qt itself ?

I'll be picking up wsegl.h and pvr2d.h from the
$(STAGING_DIR)/usr/include directory which is where the powervr
drivers installs these include files.

>Why does this need to be included in the patch, duplicating the file already existing in the staging area ?
>
> That will resolve the issue of mismatches once and for all.

It doesn't it was an oversight on my part when I was porting the patch
over. The new patch (attached) now removes the files from the
$(QT_SRCDIR)/src/3rdparty/powervr/{wsegl.h,pvr2d.h} files which should
allow the compiler to find them in the $(STAGING_DIR)/usr/include
directory.

However after removing the files, I'm getting segfaults on all demos
when powervr.ini has WindowSystem=libpvrQWSWSEGL.so.1
(WindowSystem=libpvrPVR2D_FRONTWSEGL.so works fine).  What is the best
method for debugging this further?

Attached is the patch.  To test you can remove the qt-wsegl2.patch and
qt-pvrqwswseql.patch patches and install the attached patch into the
package/qt directory. In addition, you must have the current ti-gfx
patch applied.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt-eglwsegl-use-system.patch
Type: application/octet-stream
Size: 26335 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130708/c6c6c11c/attachment-0001.obj>
