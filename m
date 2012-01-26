From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 26 Jan 2012 16:41:50 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <466d341f6889776d67143c3f5f55bf46@zacarias.com.ar>
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
 <4F216E47.4070604@visionsystems.de> <87k44e32t4.fsf@macbook.be.48ers.dk>
 <466d341f6889776d67143c3f5f55bf46@zacarias.com.ar>
Message-ID: <4F21743E.1000407@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.01.2012 16:33, schrieb Gustavo Zacarias:
> On 2012-01-26 12:23, Peter Korsgaard wrote:
>
>>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>>
>>  Yegor> Am 26.01.2012 16:13, schrieb yegorslists at googlemail.com:
>>
>>  Yegor> So here we have another issue: how can I define if files should
>>  Yegor> be copied to /lib/firmware or /lib/firmware/foo? ti-connectivity
>>  Yegor> firmware files should go direct to /lib/firmware. This is not
>>  Yegor> the case now.
>>
>> Ahh, I thought there would be a 1-to-1 relation between the
>> linux-firmware.git location an /lib/firmware. How do other distributions
>> handle it?
>
> At least for ti-connectivity it seems to be kept in /lib/firmware/ti-connectivity.
> Most of the time linux-firmware unpacks directly to /lib/firmware and that's it.
> Checking the kernel source...
>
> grep for "request_firmware" in the relevant drivers (for instance linux/drivers/net/wireless/wl12xx) and we get "ret = request_firmware(&fw, WL128X_FW_NAME"... grepping for FW_NAME gets us...
>
> wl12xx.h:#define WL1271_FW_NAME "ti-connectivity/wl1271-fw-2.bin"
> wl12xx.h:#define WL128X_FW_NAME "ti-connectivity/wl128x-fw.bin"
> wl12xx.h:#define WL127X_AP_FW_NAME "ti-connectivity/wl1271-fw-ap.bin"
> wl12xx.h:#define WL128X_AP_FW_NAME "ti-connectivity/wl128x-fw-ap.bin"
>
> So they are used in the directory no less...

You're right. This is a disadvantage of using the old kernel (2.6.37). Here WLAN driver searches for blobs directly without prepending a ti-connectivity. O.K. lets keep directory structure as is.

I replaced install with cp and have a problem, cause cp won't create a directory (ti-connectivity for example), but copies symlinks correctly. Any idea how to fix this?

Yegor
