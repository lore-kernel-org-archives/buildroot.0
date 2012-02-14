From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Feb 2012 18:30:07 +0100
Subject: [Buildroot] [PATCH v3-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <CAAXf6LWabKF4AGjg9aZsAOJ68_6avWMwBF+dpk4_2vac6nKwKA@mail.gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <201202132240.11019.arnout@mind.be>
 <CAAXf6LWabKF4AGjg9aZsAOJ68_6avWMwBF+dpk4_2vac6nKwKA@mail.gmail.com>
Message-ID: <201202141830.07813.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 14 February 2012 10:22:49 Thomas De Schampheleire wrote:
> Although I understand your reasoning, I look at it from a different angle.
> Package usb_modeswitch_data doesn't make sense if you don't have
> usb_modeswitch. No-one will think 'Hey, I want package
> usb_modeswitch_data' without realizing he should select usb_modeswitch
> first.  Therefore it makes no sense in showing the configuration option
> unless usb_modeswitch has been selected.. That's why I think that a
> 'depends on' relation is more appropriate.

 However, there may be another package later that depends on
usb_modeswitch_data.  That other package should then either select
both usb_modeswitch and usb_modeswitch_data, or it should be itself
a 'depends on'.  But for that other package, it may be much less
obvious that it's related to usb_modeswitch at all.

> The fact that usb_modeswitch in turn 'selects' libusb and
> libusb-compat is a little different. For users that want
> usb_modeswitch, the relation to libusb/libusb-compat is probably not
> clear, and so 'depends on' is not appropriate here.

 True.

> On the other hand, due to the libusb/libusb-compat select from
> usb_modeswitch, there is a problem (independent of whether
> usb_modeswitch_data uses select or depends). Suppose libusb needs to
> depend on libsomething. Then, every package that selects libusb, needs
> to also select libsomething from that point onwards.

 Exactly my point.  libusb itself shouldn't depend on another package,
it should only depend on stuff like USE_WCHAR.  Adding a 'depends on'
makes it more difficult to add packages later on.

> This shows that the usage of select should be limited as much as
> possible. 

 No, it shows that usage of 'depends on' should be limited :-P

 (I think we can carry on like this for a while :-)

> The longer the select chain, the more risk you have of
> needing to add extra selects in the future.


 If you look at the current packages, almost none use 'depends on'.
Of course, there are dependencies on 'big packages', like xorg, efl, gtk2,
gstreamer, etc.  And then there are some that are really obvious, like 
directfb-examples.  And finally, some are wrong if you ask me, like
alsamixergui.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120214/c3b1d33e/attachment-0001.html>
