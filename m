From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 30 Sep 2007 01:04:26 +0300
Subject: [Buildroot] undefined reference to `bcopy' - what's changed?
In-Reply-To: <20070929162659.GP20951@aon.at>
References: <46FE7D34.6090703@promwad.com> <20070929162659.GP20951@aon.at>
Message-ID: <46FECBEA.6060005@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer ?????:
> On Sat, Sep 29, 2007 at 07:28:36PM +0300, Ivan Kuten wrote:
>> Hi,
>>
>> I started getting this error. The same config for ARM920T, just doing svn ups and rebuilding buildroot.
>> Day ago it wasn't there.
> 
> You're trying to use a SUSv3 LEGACY function. I'd fix the package, but
> if you're not converned about bloating your build with LEGACY stuff then
> you can of course turn on support for legacy in uClibc.

Please apply fix:
package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch

diff -urN xlib_libXfont-1.2.7.orig/src/builtins/file.c xlib_libXfont-1.2.7/src/builtins/file.c
--- xlib_libXfont-1.2.7.orig/src/builtins/file.c        2007-01-17 23:49:10.000000000 +0200
+++ xlib_libXfont-1.2.7/src/builtins/file.c     2007-09-30 00:52:55.000000000 +0300
@@ -50,7 +50,7 @@
     len = BUFFILESIZE;
     if (len > left)
        len = left;
-    bcopy (io->file->bits + io->offset, f->buffer, len);
+    memmove (f->buffer, io->file->bits + io->offset, len);
     io->offset += len;
     f->left = len - 1;
     f->bufp = f->buffer + 1;


Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
