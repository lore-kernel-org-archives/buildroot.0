From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 22 Apr 2016 09:57:44 +0200
Subject: [Buildroot] [RPi3] Trying to test WiFi On Raspberr Pi 3
In-Reply-To: <CALtfCQYZXSFWSv8m5y+BkwKx-iOPrgYpZypvmtk_i2MLZebeiw@mail.gmail.com>
References: <CALtfCQYZXSFWSv8m5y+BkwKx-iOPrgYpZypvmtk_i2MLZebeiw@mail.gmail.com>
Message-ID: <CALtfCQZ9GAfL3qYuJK97XAETVhE4PNnr+R6aL-2JBC6UrRTn1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I've got updates in my WiFi issue. I had to install the following package:
crda, iw & wireless-regdb, and now I've got another log kernel:

[    5.314552] bcm2835-wdt 3f100000.watchdog: Broadcom BCM2835 watchdog
timer
[    5.402552] cfg80211: Calling CRDA to update world regulatory domain
[    5.531269] brcmfmac: brcmf_sdio_drivestrengthinit: No SDIO Drive
strength init done for chip 43430 rev 1 pmurev 24
[    5.542704] usbcore: registered new interface driver brcmfmac
[    5.646701] cfg80211: World regulatory domain updated:
[    5.651915] cfg80211:  DFS Master region: unset
[    5.656271] cfg80211:   (start_freq - end_freq @ bandwidth),
(max_antenna_gain, max_eirp), (dfs_cac_time)
[    5.666112] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A,
2000 mBm), (N/A)
[    5.674157] cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz, 92000
KHz AUTO), (N/A, 2000 mBm), (N/A)
[    5.683636] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A,
2000 mBm), (N/A)
[    5.691672] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000
KHz AUTO), (N/A, 2000 mBm), (N/A)
[    5.701197] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000
KHz AUTO), (N/A, 2000 mBm), (0 s)
[    5.710708] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A,
2000 mBm), (0 s)
[    5.718823] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A,
2000 mBm), (N/A)
[    5.726882] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz),
(N/A, 0 mBm), (N/A)
[    6.282934] bcm2835-rng 3f104000.rng: hwrng registered
[    6.287471] gpiomem-bcm2835 3f200000.gpiomem: Initialised: Registers at
0x3f20000
[    6.297029] spi spi0.0: setting up native-CS0 as GPIO 8
[    6.302858] spi spi0.1: setting up native-CS1 as GPIO 7
[    6.353559] i2c /dev entries driver
[    6.587009] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[    7.085459] NET: Registered protocol family 10
[    7.597263] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[    8.607304] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50

I see this message wit the region unset:
[5.651915] cfg80211:  DFS Master region: unset

So I've changed the region with the command:
iw reg set ES

And this is the log now:

[ 3181.016993] cfg80211: Calling CRDA for country: ES
[ 3181.038126] cfg80211: Regulatory domain changed to country: ES
[ 3181.043969] cfg80211:  DFS Master region: ETSI
[ 3181.048266] cfg80211:   (start_freq - end_freq @ bandwidth),
(max_antenna_gain, max_eirp), (dfs_cac_time)
[ 3181.058033] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A,
2000 mBm), (N/A)
[ 3181.066041] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000
KHz AUTO), (N/A, 2301 mBm), (N/A)
[ 3181.075542] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000
KHz AUTO), (N/A, 2000 mBm), (0 s)
[ 3181.085045] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A,
2698 mBm), (0 s)
[ 3181.093152] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz),
(N/A, 4000 mBm), (N/A)

But when I execute the command:
# iw dev wlan0 link
command failed: No such device (-19)

So it seems to be the device doesn't exist (Althoug I added the wlan0 to
the /etc/network/interface manually).

Any suggestions?

Best regards.

[image: photo] ?scar G?mez Fuente
Electronic Engineer & Degree in Physical Sciences
Mobile: 659.28.97.90
Email: oscargomezf at gmail.com
Website: www.oscargomezf.com
<http://facebook.com/oscargomezf>  <http://plus.google.com/oscargomezf>
<http://us.linkedin.com/in/oscargomezf>
<http://twitter.com/oscargomezf_com>

On 21 April 2016 at 18:19, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi everyone,
>
> I'm trying to check the broadcom WiFi module BCM43438 of the RPi3B. By
> default the package:
>
> Target Package --> Hardware handling  ---> Firmware  ---> linux-firmware
> ---> Ethernet firmware  ---> Broadcom BRCM bcm43xxx
>
> It's not selected. But when I select this package, I've got this error:
>
> # dmesg | grep brcm
> [    7.127904] brcmfmac: brcmf_sdio_drivestrengthinit: No SDIO Drive
> strength init done for chip 43430 rev 1 pmurev 24
> [    7.145814] usbcore: registered new interface driver brcmfmac
> [    7.162030] brcmfmac_sdio mmc1:0001:1: Direct firmware load for
> brcm/brcmfmac43430-sdio.bin failed with error -2
> [    8.186873] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
> [    9.215286] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
>
> So I noticed that the binary brcmfmac43430-sdio.bin and
> brcmfmac43430-sdio.txt it isn't copy by the linux-firmware package to
> /lib/firmware/brcm folder, so I've tried to copy the files
> brcmfmac43430-sdio.* manually  to /lib/firmware/brcm (I should be a great
> idea to add this files to the linux-firmaware package) and now I didn't get
> any error:
>
> [    7.101997] brcmfmac: brcmf_sdio_drivestrengthinit: No SDIO Drive
> strength init done for chip 43430 rev 1 pmurev 24
> [    7.120006] usbcore: registered new interface driver brcmfmac
> [    8.165326] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
> [    9.195054] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
> [   10.217086] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
> clkctl 0x50
>
> But I can see the wlan0 device. I list the folder :
>
> # ls  /sys/class/net/
> eth0  lo
>
> And the wlan0 doesn't appear.
>
> I've tried this command:
>
> # iw dev wlan0 set
> command failed: No such device (-19)
>
> Does anyone know how can I solve this problem?
>
>
> Best regards.
>
> Oscar Gomez Fuente
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160422/0f4228a8/attachment.html>
