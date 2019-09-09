From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Sep 2019 15:57:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: add Config.in
 option for WPA3
In-Reply-To: <CANQCQpZGn5EW0txRAwvKCTej6bOYiTseysFCicsRSAxnG=nvUA@mail.gmail.com>
References: <20190908151709.23971-1-geomatsi@gmail.com>
 <20190908151709.23971-2-geomatsi@gmail.com>
 <CANQCQpZGn5EW0txRAwvKCTej6bOYiTseysFCicsRSAxnG=nvUA@mail.gmail.com>
Message-ID: <ea971f3c-b542-3c5f-3e25-e8a95675ff89@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/09/2019 15:21, Matthew Weber wrote:
[snip]
> Here's where the build now fails.  Looks like the sae related linking
> issues are gone but dfs is still an issue.
> /home/foobar/c93c1f78429d022fd0f7b6db91eb860cc3d4d95b/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> ../src/ap/ieee802_11_vht.o: in function

 This object file is only enabled under the CONFIG_AP condition...

> `hostapd_eid_txpower_envelope':
> ieee802_11_vht.c:(.text+0x2c8): undefined reference to `hostapd_is_dfs_required'
> 
> This can be resolved by adding the src/ap/dfs.o to the list of items

 ... and that one gets added if CONFIG_AP and CONFIG_DRIVER_NL80211 are enabled.


> built, I'm just unsure of the right CONFIG option to set that or if it
> is an actual Makefile miss when a recent feature was added.  It will
> build successful it you enable the Buildroot
> "BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT" option that adds the missing
> objs.

 ... so I'm surprised that this fixes it for you... I'd expect enabling the
NL80211 driver would fix it.

 Anyway, it definitely looks like a bug in the wpa_supplicant Makefile. I
checked on current master and it's still like that. And openrwrt is still at 2.7
so no fixes there either.

 Regards,
 Arnout

> 
> Regards,
> Matt
> 
