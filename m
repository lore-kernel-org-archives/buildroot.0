From: Bryce Schober <bryce.schober@gmail.com>
Date: Wed, 12 Nov 2014 17:53:20 -0800
Subject: [Buildroot] out-of-tree kernel modules and linux header versions
Message-ID: <CAJpxd07isuV8UB+d2pWCjoYsdWnG7T5XM_Hm6vxyrTJi_gz9DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I modified the subject to break this discussion out of its previous thread.
Hopefully that's not too distasteful on this list...

On Wed, Nov 12, 2014 at 1:03 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> A kernel module is never built using the linux headers provided by the
> toolchain. The linux headers provided by the toolchain only contain the
> userspace part of the kernel headers, and they are therefore
> insufficient to build kernel modules (which as their name suggest,
> contain kernel code).
>
> Therefore, when you do something like:
>
> > > > define KERNELMODULE_BUILD_CMDS
> > > >    $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> > > > endef
>
> It uses the kernel code in $(LINUX_DIR), and mainly the kernel headers
> + kernel configuration, to build your kernel modules.
>

Has this always been the case? I'm on an old buildroot-2011.08 and using an
old linux 2.6.29.6 kernel, with an external toolchain built with 2.6.27
headers. I'm building a vendor's kernel module using exactly the pattern
shown in http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/99397,
and I'm getting compile errors directly corresponding to differences in
headers between the 2.6.27 and 2.6.29.6 versions.

To be much more verbose, RealTek's wireless driver's include/rtw_mlme.h:
https://github.com/pvaret/rtl8192cu-fixes/blob/master/include/rtw_mlme.h#L265
...contains a snippet like this:
#ifdef CONFIG_IOCTL_CFG80211
struct cfg80211_wifidirect_info{
    _timer                    remain_on_ch_timer;
    u8                        restore_channel;
    struct ieee80211_channel    remain_on_ch_channel;
    enum nl80211_channel_type    remain_on_ch_type;
    u64                        remain_on_ch_cookie;
    bool is_ro_ch;
};
#endif //CONFIG_IOCTL_CFG80211

Drilling down through it's include structure, you can find that the
include/osdep_service.h includes <net/cfg80211.h>:
https://github.com/pvaret/rtl8192cu-fixes/blob/master/include/osdep_service.h#L793

When objects including the rtw_mlme.h get compiled, I get the following
error:
In file included from
<snip>/buildroot/output/build/rtl8192cu-4.0.5_11249.20140422/include/drv_types.h:79,
                 from
<snip>/buildroot/output/build/rtl8192cu-4.0.5_11249.20140422/core/rtw_ioctl_query.c:25:
<snip>/buildroot/output/build/rtl8192cu-4.0.5_11249.20140422/include/rtw_mlme.h:262:
error: field 'remain_on_ch_channel' has incomplete type

This error is complaining about not knowing what "enum
nl80211_channel_type" means, and that definition was added to
linux/include/nl80211.h between 2.6.27 and 2.6.29:
http://lxr.free-electrons.com/diff/include/linux/nl80211.h?v=2.6.27;diffvar=v;diffval=2.6.29#L808

Another hint that the problem is due to getting the wrong header is that
the generated auto-dependency file lists some headers with an absolute path
and other with a relative path, including the suspicious nl80211.h header
(see attached .rtw_mlme.o.d).

I admit that the kernel module build in $(LINUX_DIR) should get its
relative include path also from $(LINUX_DIR), but all these coincidences
make me strongly suspicious that it's getting them from the 2.6.27 headers
in buildroot's sysroot instead. The verbose make output for rtw_mlme.o
doesn't show any suspicious include paths, but it doesn't show *anything*
for the buildroot/output/staging/usr/include, since that's coming from the
toolchain wrapper, right?

I see that there have been quite a few changes to the external toolchain
wrapper since 2011.08, so maybe I'll see if I can back-port it to my old
buildroot...

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/88dd6671/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .rtw_mlme.o.d
Type: text/x-dsrc
Size: 23912 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/88dd6671/attachment.bin>
