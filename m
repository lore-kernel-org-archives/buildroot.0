From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 6 May 2018 15:03:25 -0400
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: conditionally add gpl
 license
In-Reply-To: <20180503230558.397043c1@windsurf>
References: <1523502130-21870-1-git-send-email-danomimanchego123@gmail.com>
 <20180503230558.397043c1@windsurf>
Message-ID: <CANxTyt54TTEeCr-jRYmYFKvEEdaT7j0DqmFQ=vgwOp3mVqmi4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Thu, May 3, 2018 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 11 Apr 2018 23:02:10 -0400, Danomi Manchego wrote:
>> Currently, GST1_PLUGINS_BAD_LICENSE_FILES starts out set to
>> both the GPL COPYING file and the LGPL COPYING.LIB file, but
>> the GST1_PLUGINS_BAD_LICENSE handling only claims LGPL, and
>> then intelligently adds GPL if needed.  This change moves the
>> GPL file addition to the same conditional clause so that the
>> GPL file is included in the legal-info location only if GPL
>> code is actually used.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> I've applied to master, thanks. However, there's a separate but related
> issue. See below.
>
>> ---
>>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
>> index 83cb94b..9f7cd97 100644
>> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
>> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
>> @@ -8,9 +8,9 @@ GST1_PLUGINS_BAD_VERSION = 1.12.4
>>  GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
>>  GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
>>  GST1_PLUGINS_BAD_INSTALL_STAGING = YES
>> -GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
>> -# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
>> -# enabled.
>> +# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE and
>> +# GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
>> +GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
>>  GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
>>
>>  GST1_PLUGINS_BAD_CONF_OPTS = \
>> @@ -772,6 +772,7 @@ endif
>>  # Add GPL license if GPL licensed plugins enabled.
>>  ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
>>  GST1_PLUGINS_BAD_LICENSE += GPL
>
> This way of appending to the LICENSE variable is not very good, because
> the value will then be:
>
>         LGPL-2.0+, LGPL-2.1+ GPL
>
> which isn't very good. We should instead do:
>
> GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL
>
> and actually, "GPL" by itself doesn't mean much, it should be GPL-2.0
> or GPL-3.0.
>
> Would you mind looking into fixing those remaining issues ?

Okay, I'll send in a couple patches.
Danomi -


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
