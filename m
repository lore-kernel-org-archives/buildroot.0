From: Gordon Smith <spider.karma+busybox.net@gmail.com>
Date: Thu, 12 Nov 2009 11:44:48 -0700
Subject: [Buildroot] Advice needed on package/customize
In-Reply-To: <20091112084158.09e4537f@surf>
References: <2df568dc0911111623q6581f6d2ye2ef6416e79acd81@mail.gmail.com>
	<20091112084158.09e4537f@surf>
Message-ID: <2df568dc0911121044o4d1d4d2oc30c4dfc617aece9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 12, 2009 at 12:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 11 Nov 2009 17:23:46 -0700,
> Gordon Smith <spider.karma+busybox.net@gmail.com> a ?crit :
>
>> A simple case:
>>
>> In .config:
>> ? ? BR2_PACKAGE_CUSTOMIZE=y
>>
>> In package/customize/source:
>> ? ? $ ls -lA package/customize/source
>> ? ? total 4
>> ? ? -rw-r--r-- 1 gsmith gsmith 0 2009-09-01 02:44 .empty
>> ? ? -rw-r--r-- 1 gsmith gsmith 7 2009-11-11 16:57 hello.txt
>>
>> After "make", there is no hello.txt in the kernel image or in
>> rootfs.i686.initramfs_list.
>
> After changing the contents of package/customize/source, did you make a
> full rebuild (i.e clean everything and restart the build) ?
>
> If not, then the stamp file $(BUILD_DIR)/.customize already existed, so
> the contents of package/customize/source are not copied to the target
> directory. If you want to force the reinstallation of customized files
> without rebuilding everything, then do 'make customize-clean' and
> restart make.
>
> Sincerly,
>
> Thomas
> --

Merci bien for the complete answer.

I found a curiosity in the customize package - root directories are
recursively copies inside existing target directories.

Notice that "etc/hello.txt" in customize becomes "etc/etc/hello.txt"
in initramfs:

$ find package/customize -name hello.txt
package/customize/source/etc/hello.txt
package/customize/source/hello.txt

$ grep hello.txt binaries/lsdtm/rootfs.i686.initramfs_list
file /etc/etc/hello.txt
/home/gsmith/source/buildroot-2009.08-linux-2.6.27/project_build_i686/lsdtm/root/etc/etc/hello.txt
644 0 0
file /hello.txt
/home/gsmith/source/buildroot-2009.08-linux-2.6.27/project_build_i686/lsdtm/root/hello.txt
644 0 0

I modified package/customize/customize.mk as best I could to get it to
handle this:
$ diff customize-0.mk customize.mk
14c14,18
<         cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
---
>         if [ -d $(TARGET_DIR)/$$f ]; then \
>             cp -af $(CUST_DIR)/$$f/* $(TARGET_DIR)/$$f/; \
>         else \
>             cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
>         fi \


> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
