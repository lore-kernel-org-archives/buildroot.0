From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 9 Oct 2016 20:41:14 +0200
Subject: [Buildroot] raspberry pi 3 hifiberry dac+ hat not working
In-Reply-To: <4EF57C9D-A77B-4683-87DF-3694F59A1F44@ableton.com>
References: <4EF57C9D-A77B-4683-87DF-3694F59A1F44@ableton.com>
Message-ID: <20161009204114.7eb93366@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Diez,

On Thu, 11 Aug 2016 13:52:40 +0000, Diez Roggisch <diez.roggisch@ableton.com> wrote:

> Hi,
> 
> I?m having trouble getting a hifiberry dac+ to work on my RPI3 buildroot.
> 
> The system otherwise boots fine, and allows me to log in via dropbear. However e.g. the pcm512x i2c module doesn?t grab (as it should according to hifi-berry developers) the $4d address on the i2c-bus. Also, no ALSA-cards are being found.
> 
> I found one clear bug which I hope to add as pull-request to the buildroot-repo where the VFAT-boot-partition doesn?t contain the overlays/*.dtbo-files necessary to work with the config.txt dtoverlay=hifiberry-dacplus to be executed. Once that was fixed though, I?m out of ideas to what the problem could be.
> 

The overlay directory should be included with up to date buildroot git repository
for  RPi3 (see [1]).

For hifiberry dac+ the following modprobe worked for me
on RPi-B+ (not yet testet on RPi3):

modprobe i2c-bcm2708
modprobe clk-hifiberry-dacpro
modprobe snd-soc-core
modprobe snd-soc-pcm512x
modprobe snd-soc-pcm512x-i2c
modprobe snd-soc-bcm2835-i2s
modprobe snd-soc-hifiberry-dacplus

with the following in config.txt (I think not all necessary):

dtparam=i2c=on
dtparam=spi=on
dtparam=i2s=on
dtoverlay=i2s-mmap
dtoverlay=i2c0-bcm2708
dtoverlay=i2c1-bcm2708
dtoverlay=hifiberry-dacplus

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=1e03cc2290f98fc7434254d2abd9afd504de8360


> Any suggestions on how to tackle this are welcome. The output of various relevant commands follows below.
> 
> Cheers,
> 
> Diez
> 
> 
> 
> # uname -a
> Linux rpi3-dir 4.4.8-v7 #1 SMP Wed Aug 10 17:54:28 CEST 2016 armv7l GNU/Linux
> 
> # vcdbg log msg
> 000998.165: HDMI:EDID version 1.3, 1 extensions, screen size 52x32 cm
> 000998.230: HDMI:EDID features - videodef 0x80 standby suspend active off; colour encoding:RGB444|YCbCr422; sRGB is not default colourspace; preferred format is native; does not support GTF
> 000998.322: HDMI:EDID found preferred DMT detail timing format: 1920x1200p @ 60 Hz (68)
> 000998.362: HDMI:EDID found DMT format: code 4, 640x480p @ 60 Hz in established timing I/II
> 000998.401: HDMI:EDID found DMT format: code 6, 640x480p @ 75 Hz in established timing I/II
> 000998.437: HDMI:EDID found DMT format: code 9, 800x600p @ 60 Hz in established timing I/II
> 000998.475: HDMI:EDID found DMT format: code 11, 800x600p @ 75 Hz in established timing I/II
> 000998.513: HDMI:EDID found DMT format: code 16, 1024x768p @ 60 Hz in established timing I/II
> 000998.551: HDMI:EDID found DMT format: code 18, 1024x768p @ 75 Hz in established timing I/II
> 000998.592: HDMI:EDID found DMT format: code 36, 1280x1024p @ 75 Hz in established timing I/II
> 000998.678: HDMI:EDID standard timings block x 8: 0x8180 A940 D100 714F 0101 0101 0101 0101
> 000998.728: HDMI:EDID found DMT format: code 35, 1280x1024p @ 60 Hz (5:4) in standard timing 0
> 000998.778: HDMI:EDID found DMT format: code 51, 1600x1200p @ 60 Hz (4:3) in standard timing 1
> 000998.829: HDMI:EDID found DMT format: code 69, 1920x1200p @ 60 Hz (16:10) in standard timing 2
> 000998.877: HDMI:EDID found DMT format: code 21, 1152x864p @ 75 Hz (4:3) in standard timing 3
> 001011.880: HDMI:EDID parsing v3 CEA extension 0
> 001011.919: HDMI:EDID monitor support - underscan IT formats:yes, basic audio:yes, yuv444:yes, yuv422:yes, #native DTD:1
> 001011.964: HDMI:EDID found CEA detail timing format: 1920x1080p @ 60 Hz (16)
> 001012.007: HDMI:EDID found CEA detail timing format: 1920x1080i @ 60 Hz (5)
> 001012.047: HDMI:EDID found CEA detail timing format: 1280x720p @ 60 Hz (4)
> 001012.086: HDMI:EDID found CEA detail timing format: 720x480p @ 60 Hz (2)
> 001012.123: HDMI:EDID found CEA format: code 16, 1920x1080p @ 60Hz (native)
> 001012.157: HDMI:EDID found CEA format: code 5, 1920x1080i @ 60Hz
> 001012.188: HDMI:EDID found CEA format: code 4, 1280x720p @ 60Hz
> 001012.220: HDMI:EDID found CEA format: code 3, 720x480p @ 60Hz
> 001012.252: HDMI:EDID found CEA format: code 2, 720x480p @ 60Hz
> 001012.285: HDMI:EDID found CEA format: code 7, 1440x480i @ 60Hz
> 001012.319: HDMI:EDID found CEA format: code 22, 1440x576i @ 50Hz
> 001012.349: HDMI:EDID found CEA format: code 1, 640x480p @ 60Hz
> 001012.382: HDMI:EDID found CEA format: code 31, 1920x1080p @ 50Hz
> 001012.415: HDMI:EDID found CEA format: code 18, 720x576p @ 50Hz
> 001012.448: HDMI:EDID found CEA format: code 19, 1280x720p @ 50Hz
> 001012.481: HDMI:EDID found CEA format: code 20, 1920x1080i @ 50Hz
> 001012.513: HDMI:EDID found CEA format: code 32, 1920x1080p @ 24Hz
> 001012.546: HDMI:EDID found CEA format: code 21, 1440x576i @ 50Hz
> 001012.578: HDMI:EDID found CEA format: code 17, 720x576p @ 50Hz
> 001012.610: HDMI:EDID found CEA format: code 6, 1440x480i @ 60Hz
> 001012.663: HDMI:EDID found audio format 2 channels PCM, sample rate: 32|44|48 kHz, sample size: 16|20|24 bits
> 001012.680: HDMI:EDID found HDMI VSDB length 7
> 001012.705: HDMI:EDID HDMI VSDB has physical address 1.0.0.0
> 001012.725: HDMI:EDID HDMI VSDB supports AI:no, dual link DVI:no
> 001012.755: HDMI:EDID HDMI VSDB deep colour support - 48-bit:no 36-bit:yes 30-bit:yes DC_yuv444:yes
> 001012.774: HDMI:EDID HDMI VSDB max TMDS clock 225 MHz
> 001012.791: HDMI:EDID HDMI VSDB has no latency information
> 001012.823: HDMI:EDID extended data block tag 0x05 length 3 not supported
> 001012.861: HDMI:EDID filtering formats with pixel clock > 162 MHz or h. blanking > 1023
> 001013.079: HDMI:EDID filtering out DMT format: 1920x1200p @ 60 Hz (69) with pixel clock 193 MHz and hfp:136 hs:200 hbp:336
> 001013.139: HDMI:EDID preferred mode remained as DMT (68) 1920x1200p @ 60 Hz with pixel clock 154 MHz
> 001027.053: HDMI:Setting property pixel encoding to Default
> 001027.073: HDMI:Setting property pixel clock type to PAL
> 001027.091: HDMI:Setting property content type flag to No data
> 001027.110: HDMI:Setting property fuzzy format match to enabled
> 001215.051: hdmi: HDMI:>>>>>>>>>>>>>Rx sensed, reading EDID<<<<<<<<<<<<<
> 001227.184: hdmi: HDMI:EDID version 1.3, 1 extensions, screen size 52x32 cm
> 001227.254: hdmi: HDMI:EDID features - videodef 0x80 standby suspend active off; colour encoding:RGB444|YCbCr422; sRGB is not default colourspace; preferred format is native; does not support GTF
> 001227.349: hdmi: HDMI:EDID found preferred DMT detail timing format: 1920x1200p @ 60 Hz (68)
> 001227.394: hdmi: HDMI:EDID found DMT format: code 4, 640x480p @ 60 Hz in established timing I/II
> 001227.435: hdmi: HDMI:EDID found DMT format: code 6, 640x480p @ 75 Hz in established timing I/II
> 001227.477: hdmi: HDMI:EDID found DMT format: code 9, 800x600p @ 60 Hz in established timing I/II
> 001227.516: hdmi: HDMI:EDID found DMT format: code 11, 800x600p @ 75 Hz in established timing I/II
> 001227.560: hdmi: HDMI:EDID found DMT format: code 16, 1024x768p @ 60 Hz in established timing I/II
> 001227.602: hdmi: HDMI:EDID found DMT format: code 18, 1024x768p @ 75 Hz in established timing I/II
> 001227.646: hdmi: HDMI:EDID found DMT format: code 36, 1280x1024p @ 75 Hz in established timing I/II
> 001227.738: hdmi: HDMI:EDID standard timings block x 8: 0x8180 A940 D100 714F 0101 0101 0101 0101
> 001227.793: hdmi: HDMI:EDID found DMT format: code 35, 1280x1024p @ 60 Hz (5:4) in standard timing 0
> 001227.848: hdmi: HDMI:EDID found DMT format: code 51, 1600x1200p @ 60 Hz (4:3) in standard timing 1
> 001227.905: hdmi: HDMI:EDID found DMT format: code 69, 1920x1200p @ 60 Hz (16:10) in standard timing 2
> 001227.958: hdmi: HDMI:EDID found DMT format: code 21, 1152x864p @ 75 Hz (4:3) in standard timing 3
> 001240.967: hdmi: HDMI:EDID parsing v3 CEA extension 0
> 001241.008: hdmi: HDMI:EDID monitor support - underscan IT formats:yes, basic audio:yes, yuv444:yes, yuv422:yes, #native DTD:1
> 001241.055: hdmi: HDMI:EDID found CEA detail timing format: 1920x1080p @ 60 Hz (16)
> 001241.099: hdmi: HDMI:EDID found CEA detail timing format: 1920x1080i @ 60 Hz (5)
> 001241.145: hdmi: HDMI:EDID found CEA detail timing format: 1280x720p @ 60 Hz (4)
> 001241.190: hdmi: HDMI:EDID found CEA detail timing format: 720x480p @ 60 Hz (2)
> 001241.229: hdmi: HDMI:EDID found CEA format: code 16, 1920x1080p @ 60Hz (native)
> 001241.265: hdmi: HDMI:EDID found CEA format: code 5, 1920x1080i @ 60Hz
> 001241.301: hdmi: HDMI:EDID found CEA format: code 4, 1280x720p @ 60Hz
> 001241.337: hdmi: HDMI:EDID found CEA format: code 3, 720x480p @ 60Hz
> 001241.372: hdmi: HDMI:EDID found CEA format: code 2, 720x480p @ 60Hz
> 001241.406: hdmi: HDMI:EDID found CEA format: code 7, 1440x480i @ 60Hz
> 001241.442: hdmi: HDMI:EDID found CEA format: code 22, 1440x576i @ 50Hz
> 001241.478: hdmi: HDMI:EDID found CEA format: code 1, 640x480p @ 60Hz
> 001241.515: hdmi: HDMI:EDID found CEA format: code 31, 1920x1080p @ 50Hz
> 001241.552: hdmi: HDMI:EDID found CEA format: code 18, 720x576p @ 50Hz
> 001241.586: hdmi: HDMI:EDID found CEA format: code 19, 1280x720p @ 50Hz
> 001241.623: hdmi: HDMI:EDID found CEA format: code 20, 1920x1080i @ 50Hz
> 001241.660: hdmi: HDMI:EDID found CEA format: code 32, 1920x1080p @ 24Hz
> 001241.695: hdmi: HDMI:EDID found CEA format: code 21, 1440x576i @ 50Hz
> 001241.731: hdmi: HDMI:EDID found CEA format: code 17, 720x576p @ 50Hz
> 001241.767: hdmi: HDMI:EDID found CEA format: code 6, 1440x480i @ 60Hz
> 001241.822: hdmi: HDMI:EDID found audio format 2 channels PCM, sample rate: 32|44|48 kHz, sample size: 16|20|24 bits
> 001241.844: hdmi: HDMI:EDID found HDMI VSDB length 7
> 001241.873: hdmi: HDMI:EDID HDMI VSDB has physical address 1.0.0.0
> 001241.898: hdmi: HDMI:EDID HDMI VSDB supports AI:no, dual link DVI:no
> 001241.933: hdmi: HDMI:EDID HDMI VSDB deep colour support - 48-bit:no 36-bit:yes 30-bit:yes DC_yuv444:yes
> 001241.957: hdmi: HDMI:EDID HDMI VSDB max TMDS clock 225 MHz
> 001241.975: hdmi: HDMI:EDID HDMI VSDB has no latency information
> 001242.008: hdmi: HDMI:EDID extended data block tag 0x05 length 3 not supported
> 001242.048: hdmi: HDMI:EDID filtering formats with pixel clock > 162 MHz or h. blanking > 1023
> 001242.269: hdmi: HDMI:EDID filtering out DMT format: 1920x1200p @ 60 Hz (69) with pixel clock 193 MHz and hfp:136 hs:200 hbp:336
> 001242.334: hdmi: HDMI:EDID preferred mode remained as DMT (68) 1920x1200p @ 60 Hz with pixel clock 154 MHz
> 001242.356: hdmi: HDMI: hotplug attached with HDMI support
> 001242.423: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
> 001244.891: hdmi: HDMI: power_on to DMT mode WUXGA rb
> 001248.064: hdmi: HDMI: Action callback added to queue to happen at frame 0
> 001265.737: *** Restart logging
> 001266.902: Read command line from file 'cmdline.txt'
> root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
> 001517.234: Loading 'zImage' to 0x8000 size 0x4060c4
> 001526.778: Kernel trailer DTOK property says yes
> 001526.794: Kernel trailer DDTK property says yes
> 001529.703: Loading 'bcm2710-rpi-3-b.dtb' to 0x40e0c4 size 0x3518
> 001539.442: dtdebug: delete_node(/__local_fixups__)
> 001544.959: dtdebug: /aliases:i2c_vc=i2c0
> 001549.818: dtdebug: /__symbols__:i2c_vc=i2c0
> 001553.752: dtdebug: /__overrides__:i2c_vc=i2c0
> 001561.317: dtdebug: /__overrides__:i2c_vc_baudrate=i2c0_baudrate
> 001564.127: dtdebug: /aliases:i2c=i2c1
> 001569.125: dtdebug: /__symbols__:i2c=i2c1
> 001573.154: dtdebug: /__overrides__:i2c=i2c1
> 001576.003: dtdebug: /aliases:i2c_arm=i2c1
> 001581.012: dtdebug: /__symbols__:i2c_arm=i2c1
> 001585.105: dtdebug: /__overrides__:i2c_arm=i2c1
> 001592.855: dtdebug: /__overrides__:i2c_baudrate=i2c1_baudrate
> 001600.662: dtdebug: /__overrides__:i2c_arm_baudrate=i2c1_baudrate
> 001600.693: dtparam: uart0_clkrate=48000000
> 001603.219: dtdebug: Found override uart0_clkrate
> 001603.267: dtdebug: override uart0_clkrate: cell target clock-frequency @ offset 0 (size 4)
> 001618.592: dtdebug: Opened overlay file 'overlays/pi3-disable-bt.dtbo'
> 001627.589: Loaded overlay 'pi3-disable-bt'
> 001627.645: dtdebug: Found fragment 0 (offset 36)
> 001633.635: dtdebug: merge_fragment(/soc/uart at 7e215040,/fragment at 0/__overlay__)
> 001633.660: dtdebug: +prop(status)
> 001634.807: dtdebug: merge_fragment() end
> 001634.865: dtdebug: Found fragment 1 (offset 116)
> 001638.927: dtdebug: merge_fragment(/soc/uart at 7e201000,/fragment at 1/__overlay__)
> 001638.953: dtdebug: +prop(pinctrl-names)
> 001640.312: dtdebug: +prop(pinctrl-0)
> 001641.677: dtdebug: +prop(status)
> 001643.035: dtdebug: merge_fragment() end
> 001643.096: dtdebug: Found fragment 2 (offset 228)
> 001646.872: dtdebug: merge_fragment(/soc/gpio at 7e200000/uart0_pins,/fragment at 2/__overlay__)
> 001646.898: dtdebug: +prop(brcm,pins)
> 001648.225: dtdebug: +prop(brcm,function)
> 001649.568: dtdebug: +prop(brcm,pull)
> 001650.917: dtdebug: merge_fragment() end
> 001650.978: dtdebug: Found fragment 3 (offset 320)
> 001651.320: dtdebug: merge_fragment(/aliases,/fragment at 3/__overlay__)
> 001651.345: dtdebug: +prop(serial0)
> 001653.655: dtdebug: +prop(serial1)
> 001655.992: dtdebug: merge_fragment() end
> 001658.469: dtdebug: Opened overlay file 'overlays/hifiberry-dacplus.dtbo'
> 001672.479: Loaded overlay 'hifiberry-dacplus'
> 001672.506: dtparam: i2c=on
> 001672.721: dtdebug: /__overrides__ has no i2c property
> 001675.191: dtdebug: Found override i2c
> 001675.224: dtdebug: override i2c: string target 'status'
> 001681.111: dtparam: i2s=on
> 001681.330: dtdebug: /__overrides__ has no i2s property
> 001683.891: dtdebug: Found override i2s
> 001683.924: dtdebug: override i2s: string target 'status'
> 001688.410: dtparam: spi=on
> 001688.625: dtdebug: /__overrides__ has no spi property
> 001691.185: dtdebug: Found override spi
> 001691.218: dtdebug: override spi: string target 'status'
> 001695.913: dtdebug: Found fragment 0 (offset 36)
> 001700.988: dtdebug: merge_fragment(/clocks,/fragment at 0/__overlay__)
> 001705.264: dtdebug: merge_fragment(/clocks/dacpro_osc,/fragment at 0/__overlay__/dacpro_osc)
> 001705.292: dtdebug: +prop(compatible)
> 001706.030: dtdebug: +prop(#clock-cells)
> 001706.862: dtdebug: +prop(phandle)
> 001707.685: dtdebug: merge_fragment() end
> 001707.713: dtdebug: merge_fragment() end
> 001707.787: dtdebug: Found fragment 1 (offset 184)
> 001712.448: dtdebug: merge_fragment(/soc/i2s at 7e203000,/fragment at 1/__overlay__)
> 001712.474: dtdebug: +prop(status)
> 001713.760: dtdebug: merge_fragment() end
> 001713.816: dtdebug: Found fragment 2 (offset 260)
> 001720.908: dtdebug: merge_fragment(/soc/i2c at 7e804000,/fragment at 2/__overlay__)
> 001720.936: dtdebug: +prop(#address-cells)
> 001721.967: dtdebug: +prop(#size-cells)
> 001723.005: dtdebug: +prop(status)
> 001727.428: dtdebug: merge_fragment(/soc/i2c at 7e804000/pcm5122 at 4d,/fragment at 2/__overlay__/pcm5122 at 4d)
> 001727.454: dtdebug: +prop(#sound-dai-cells)
> 001728.576: dtdebug: +prop(compatible)
> 001729.582: dtdebug: +prop(reg)
> 001730.647: dtdebug: +prop(clocks)
> 001731.734: dtdebug: +prop(status)
> 001732.868: dtdebug: merge_fragment() end
> 001732.899: dtdebug: merge_fragment() end
> 001732.981: dtdebug: Found fragment 3 (offset 480)
> 001741.892: dtdebug: merge_fragment(/soc/sound,/fragment at 3/__overlay__)
> 001741.919: dtdebug: +prop(compatible)
> 001742.769: dtdebug: +prop(i2s-controller)
> 001743.992: dtdebug: +prop(status)
> 001744.852: dtdebug: merge_fragment() end
> 001791.745: dtparam: arm_freq=1200000000
> 001794.453: dtdebug: Found override arm_freq
> 001794.503: dtdebug: override arm_freq: cell target clock-frequency @ offset 0 (size 4)
> 001803.522: dtdebug: override arm_freq: cell target clock-frequency @ offset 0 (size 4)
> 001812.635: dtdebug: override arm_freq: cell target clock-frequency @ offset 0 (size 4)
> 001821.826: dtdebug: override arm_freq: cell target clock-frequency @ offset 0 (size 4)
> 001831.105: dtparam: core_freq=400000000
> 001833.948: dtdebug: Found override core_freq
> 001833.996: dtdebug: override core_freq: cell target clock-frequency @ offset 0 (size 4)
> 001841.454: dtparam: cache_line_size=64
> 001844.148: dtdebug: Found override cache_line_size
> 001844.196: dtdebug: override cache_line_size: cell target cache-line-size @ offset 0 (size 4)
> 001850.528: dtdebug: delete_node(/hat)
> 001857.604: Device tree loaded to 0x2efec500 (size 0x3a71)
> 001859.882: gpioman: gpioman_get_pin_num: pin SDCARD_CONTROL_POWER not defined
> 002204.837: hdmi: HDMI: hotplug deassert
> 002204.853: hdmi: HDMI: HDMI is currently on
> 002204.866: hdmi: HDMI: changing mode to unplugged
> 002354.862: hdmi: HDMI:>>>>>>>>>>>>>Rx sensed, reading EDID<<<<<<<<<<<<<
> 002366.917: hdmi: HDMI:EDID version 1.3, 1 extensions, screen size 52x32 cm
> 002366.986: hdmi: HDMI:EDID features - videodef 0x80 standby suspend active off; colour encoding:RGB444|YCbCr422; sRGB is not default colourspace; preferred format is native; does not support GTF
> 002367.081: hdmi: HDMI:EDID found preferred DMT detail timing format: 1920x1200p @ 60 Hz (68)
> 002367.123: hdmi: HDMI:EDID found DMT format: code 4, 640x480p @ 60 Hz in established timing I/II
> 002367.166: hdmi: HDMI:EDID found DMT format: code 6, 640x480p @ 75 Hz in established timing I/II
> 002367.206: hdmi: HDMI:EDID found DMT format: code 9, 800x600p @ 60 Hz in established timing I/II
> 002367.248: hdmi: HDMI:EDID found DMT format: code 11, 800x600p @ 75 Hz in established timing I/II
> 002367.289: hdmi: HDMI:EDID found DMT format: code 16, 1024x768p @ 60 Hz in established timing I/II
> 002367.330: hdmi: HDMI:EDID found DMT format: code 18, 1024x768p @ 75 Hz in established timing I/II
> 002367.375: hdmi: HDMI:EDID found DMT format: code 36, 1280x1024p @ 75 Hz in established timing I/II
> 002367.464: hdmi: HDMI:EDID standard timings block x 8: 0x8180 A940 D100 714F 0101 0101 0101 0101
> 002367.517: hdmi: HDMI:EDID found DMT format: code 35, 1280x1024p @ 60 Hz (5:4) in standard timing 0
> 002367.571: hdmi: HDMI:EDID found DMT format: code 51, 1600x1200p @ 60 Hz (4:3) in standard timing 1
> 002367.626: hdmi: HDMI:EDID found DMT format: code 69, 1920x1200p @ 60 Hz (16:10) in standard timing 2
> 002367.677: hdmi: HDMI:EDID found DMT format: code 21, 1152x864p @ 75 Hz (4:3) in standard timing 3
> 002380.685: hdmi: HDMI:EDID parsing v3 CEA extension 0
> 002380.728: hdmi: HDMI:EDID monitor support - underscan IT formats:yes, basic audio:yes, yuv444:yes, yuv422:yes, #native DTD:1
> 002380.776: hdmi: HDMI:EDID found CEA detail timing format: 1920x1080p @ 60 Hz (16)
> 002380.822: hdmi: HDMI:EDID found CEA detail timing format: 1920x1080i @ 60 Hz (5)
> 002380.867: hdmi: HDMI:EDID found CEA detail timing format: 1280x720p @ 60 Hz (4)
> 002380.910: hdmi: HDMI:EDID found CEA detail timing format: 720x480p @ 60 Hz (2)
> 002380.951: hdmi: HDMI:EDID found CEA format: code 16, 1920x1080p @ 60Hz (native)
> 002380.988: hdmi: HDMI:EDID found CEA format: code 5, 1920x1080i @ 60Hz
> 002381.023: hdmi: HDMI:EDID found CEA format: code 4, 1280x720p @ 60Hz
> 002381.058: hdmi: HDMI:EDID found CEA format: code 3, 720x480p @ 60Hz
> 002381.094: hdmi: HDMI:EDID found CEA format: code 2, 720x480p @ 60Hz
> 002381.130: hdmi: HDMI:EDID found CEA format: code 7, 1440x480i @ 60Hz
> 002381.167: hdmi: HDMI:EDID found CEA format: code 22, 1440x576i @ 50Hz
> 002381.201: hdmi: HDMI:EDID found CEA format: code 1, 640x480p @ 60Hz
> 002381.236: hdmi: HDMI:EDID found CEA format: code 31, 1920x1080p @ 50Hz
> 002381.272: hdmi: HDMI:EDID found CEA format: code 18, 720x576p @ 50Hz
> 002381.308: hdmi: HDMI:EDID found CEA format: code 19, 1280x720p @ 50Hz
> 002381.344: hdmi: HDMI:EDID found CEA format: code 20, 1920x1080i @ 50Hz
> 002381.381: hdmi: HDMI:EDID found CEA format: code 32, 1920x1080p @ 24Hz
> 002381.418: hdmi: HDMI:EDID found CEA format: code 21, 1440x576i @ 50Hz
> 002381.452: hdmi: HDMI:EDID found CEA format: code 17, 720x576p @ 50Hz
> 002381.486: hdmi: HDMI:EDID found CEA format: code 6, 1440x480i @ 60Hz
> 002381.543: hdmi: HDMI:EDID found audio format 2 channels PCM, sample rate: 32|44|48 kHz, sample size: 16|20|24 bits
> 002381.563: hdmi: HDMI:EDID found HDMI VSDB length 7
> 002381.592: hdmi: HDMI:EDID HDMI VSDB has physical address 1.0.0.0
> 002381.615: hdmi: HDMI:EDID HDMI VSDB supports AI:no, dual link DVI:no
> 002381.648: hdmi: HDMI:EDID HDMI VSDB deep colour support - 48-bit:no 36-bit:yes 30-bit:yes DC_yuv444:yes
> 002381.670: hdmi: HDMI:EDID HDMI VSDB max TMDS clock 225 MHz
> 002381.690: hdmi: HDMI:EDID HDMI VSDB has no latency information
> 002381.725: hdmi: HDMI:EDID extended data block tag 0x05 length 3 not supported
> 002381.766: hdmi: HDMI:EDID filtering formats with pixel clock > 162 MHz or h. blanking > 1023
> 002381.991: hdmi: HDMI:EDID filtering out DMT format: 1920x1200p @ 60 Hz (69) with pixel clock 193 MHz and hfp:136 hs:200 hbp:336
> 002382.054: hdmi: HDMI:EDID preferred mode remained as DMT (68) 1920x1200p @ 60 Hz with pixel clock 154 MHz
> 002382.078: hdmi: HDMI: hotplug attached with HDMI support
> 003519.243: vchiq_core: vchiq_init_state: slot_zero = 0xee880000, is_master = 1
> 003523.568: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
> 003528.577: TV service:host side not connected, dropping notification 0x00000002, 0x00000002, 0x00000044
> 
>  
> # dmesg
> [ 0.000000] Booting Linux on physical CPU 0x0
> [ 0.000000] Initializing cgroup subsys cpuset
> [ 0.000000] Initializing cgroup subsys cpu
> [ 0.000000] Initializing cgroup subsys cpuacct
> [ 0.000000] Linux version 4.4.8-v7 (dir at dir) (gcc version 5.3.1 20160113 (Linaro GCC 5.3-2016.02) ) #1 SMP Wed Aug 10 17:54:28 CEST 2016
> [ 0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
> [ 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [ 0.000000] Machine model: Raspberry Pi 3 Model B Rev 1.2
> [ 0.000000] cma: Reserved 8 MiB at 0x2e400000
> [ 0.000000] Memory policy: Data cache writealloc
> [ 0.000000] On node 0 totalpages: 192512
> [ 0.000000] free_area_init_node: node 0, pgdat 808c0d40, node_mem_map add64000
> [ 0.000000] Normal zone: 1692 pages used for memmap
> [ 0.000000] Normal zone: 0 pages reserved
> [ 0.000000] Normal zone: 192512 pages, LIFO batch:31
> [ 0.000000] [bcm2709_smp_init_cpus] enter (9540->f3003010)
> [ 0.000000] [bcm2709_smp_init_cpus] ncores=4
> [ 0.000000] PERCPU: Embedded 13 pages/cpu @aefab000 s22592 r8192 d22464 u53248
> [ 0.000000] pcpu-alloc: s22592 r8192 d22464 u53248 alloc=13*4096
> [ 0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> [ 0.000000] Built 1 zonelists in Zone order, mobility grouping on. Total pages: 190820
> [ 0.000000] Kernel command line: 8250.nr_uarts=1 dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1200 bcm2709.boardrev=0xa02082 bcm2709.serial=0xd398b05f smsc95xx.macaddr=B8:27:EB:98:B0:5F bcm2708_fb.fbswap=1 bcm2709.uart_clock=48000000 vc_mem.mem_base=0x3dc00000 vc_mem.mem_size=0x3f000000 root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
> [ 0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [ 0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
> [ 0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
> [ 0.000000] Memory: 744208K/770048K available (6350K kernel code, 432K rwdata, 1708K rodata, 476K init, 764K bss, 17648K reserved, 8192K cma-reserved)
> [ 0.000000] Virtual kernel memory layout:
> [ 0.000000] vector : 0xffff0000 - 0xffff1000 ( 4 kB)
> [ 0.000000] fixmap : 0xffc00000 - 0xfff00000 (3072 kB)
> [ 0.000000] vmalloc : 0xaf800000 - 0xff800000 (1280 MB)
> [ 0.000000] lowmem : 0x80000000 - 0xaf000000 ( 752 MB)
> [ 0.000000] modules : 0x7f000000 - 0x80000000 ( 16 MB)
> [ 0.000000] .text : 0x80008000 - 0x807e6a58 (8059 kB)
> [ 0.000000] .init : 0x807e7000 - 0x8085e000 ( 476 kB)
> [ 0.000000] .data : 0x8085e000 - 0x808ca0b0 ( 433 kB)
> [ 0.000000] .bss : 0x808cd000 - 0x8098c194 ( 765 kB)
> [ 0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [ 0.000000] Hierarchical RCU implementation.
> [ 0.000000] Build-time adjustment of leaf fanout to 32.
> [ 0.000000] NR_IRQS:16 nr_irqs:16 16
> [ 0.000000] Architected cp15 timer(s) running at 19.20MHz (phys).
> [ 0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
> [ 0.000008] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
> [ 0.000026] Switching to timer-based delay loop, resolution 52ns
> [ 0.000284] Console: colour dummy device 80x30
> [ 0.001288] console [tty1] enabled
> [ 0.001340] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=192000)
> [ 0.001408] pid_max: default: 32768 minimum: 301
> [ 0.001731] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
> [ 0.001774] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
> [ 0.002728] Disabling cpuset control group subsystem
> [ 0.002785] Initializing cgroup subsys io
> [ 0.002836] Initializing cgroup subsys memory
> [ 0.002895] Initializing cgroup subsys devices
> [ 0.002937] Initializing cgroup subsys freezer
> [ 0.002979] Initializing cgroup subsys net_cls
> [ 0.003049] CPU: Testing write buffer coherency: ok
> [ 0.003137] ftrace: allocating 21094 entries in 62 pages
> [ 0.053404] CPU0: update cpu_capacity 1024
> [ 0.053466] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [ 0.053499] [bcm2709_smp_prepare_cpus] enter
> [ 0.053657] Setting up static identity map for 0x8240 - 0x8274
> [ 0.055316] [bcm2709_boot_secondary] cpu:1 started (0) 18
> [ 0.055677] [bcm2709_secondary_init] enter cpu:1
> [ 0.055719] CPU1: update cpu_capacity 1024
> [ 0.055725] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [ 0.056101] [bcm2709_boot_secondary] cpu:2 started (0) 17
> [ 0.056359] [bcm2709_secondary_init] enter cpu:2
> [ 0.056380] CPU2: update cpu_capacity 1024
> [ 0.056386] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> [ 0.056748] [bcm2709_boot_secondary] cpu:3 started (0) 17
> [ 0.056930] [bcm2709_secondary_init] enter cpu:3
> [ 0.056950] CPU3: update cpu_capacity 1024
> [ 0.056956] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> [ 0.057016] Brought up 4 CPUs
> [ 0.057113] SMP: Total of 4 processors activated (153.60 BogoMIPS).
> [ 0.057142] CPU: All CPU(s) started in HYP mode.
> [ 0.057168] CPU: Virtualization extensions available.
> [ 0.057803] devtmpfs: initialized
> [ 0.067415] VFP support v0.3: implementor 41 architecture 3 part 40 variant 3 rev 4
> [ 0.067774] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [ 0.068493] pinctrl core: initialized pinctrl subsystem
> [ 0.069036] NET: Registered protocol family 16
> [ 0.074067] DMA: preallocated 4096 KiB pool for atomic coherent allocations
> [ 0.081263] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
> [ 0.081312] hw-breakpoint: maximum watchpoint size is 8 bytes.
> [ 0.081482] Serial: AMBA PL011 UART driver
> [ 0.081642] uart-pl011 3f201000.uart: could not find pctldev for node /soc/gpio at 7e200000/uart0_pins, deferring probe
> [ 0.081848] bcm2835-mbox 3f00b880.mailbox: mailbox enabled
> [ 0.144059] bcm2835-dma 3f007000.dma: DMA legacy API manager at f3007000, dmachans=0x1
> [ 0.145755] SCSI subsystem initialized
> [ 0.145962] usbcore: registered new interface driver usbfs
> [ 0.146073] usbcore: registered new interface driver hub
> [ 0.146191] usbcore: registered new device driver usb
> [ 0.152967] raspberrypi-firmware soc:firmware: Attached to firmware from 2016-06-02 16:01
> [ 0.180081] clocksource: Switched to clocksource arch_sys_counter
> [ 0.225087] FS-Cache: Loaded
> [ 0.225400] CacheFiles: Loaded
> [ 0.237594] NET: Registered protocol family 2
> [ 0.238461] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
> [ 0.238599] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
> [ 0.238809] TCP: Hash tables configured (established 8192 bind 8192)
> [ 0.238922] UDP hash table entries: 512 (order: 2, 16384 bytes)
> [ 0.238990] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
> [ 0.239239] NET: Registered protocol family 1
> [ 0.239580] RPC: Registered named UNIX socket transport module.
> [ 0.239612] RPC: Registered udp transport module.
> [ 0.239640] RPC: Registered tcp transport module.
> [ 0.239667] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [ 0.240636] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 7 counters available
> [ 0.242050] futex hash table entries: 1024 (order: 4, 65536 bytes)
> [ 0.255135] VFS: Disk quotas dquot_6.6.0
> [ 0.255465] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> [ 0.257773] FS-Cache: Netfs 'nfs' registered for caching
> [ 0.258678] NFS: Registering the id_resolver key type
> [ 0.258741] Key type id_resolver registered
> [ 0.258769] Key type id_legacy registered
> [ 0.261100] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
> [ 0.261269] io scheduler noop registered
> [ 0.261303] io scheduler deadline registered
> [ 0.261372] io scheduler cfq registered (default)
> [ 0.263880] BCM2708FB: allocated DMA memory ee800000
> [ 0.263928] BCM2708FB: allocated DMA channel 0 @ f3007000
> [ 0.297594] Console: switching to colour frame buffer device 240x75
> [ 0.317738] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
> [ 1.232810] bcm2835-rng 3f104000.rng: hwrng registered
> [ 1.233078] vc-cma: Videocore CMA driver
> [ 1.233162] vc-cma: vc_cma_base = 0x00000000
> [ 1.233245] vc-cma: vc_cma_size = 0x00000000 (0 MiB)
> [ 1.233335] vc-cma: vc_cma_initial = 0x00000000 (0 MiB)
> [ 1.233674] vc-mem: phys_addr:0x00000000 mem_base=0x3dc00000 mem_size:0x3f000000(1008 MiB)
> [ 1.248313] brd: module loaded
> [ 1.256988] loop: module loaded
> [ 1.257973] vchiq: vchiq_init_state: slot_zero = 0xae880000, is_master = 0
> [ 1.259588] Loading iSCSI transport class v2.0-870.
> [ 1.260371] usbcore: registered new interface driver smsc95xx
> [ 1.260514] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
> [ 1.460879] Core Release: 2.80a
> [ 1.460950] Setting default values for core params
> [ 1.461055] Finished setting default values for core params
> [ 1.661501] Using Buffer DMA mode
> [ 1.661567] Periodic Transfer Interrupt Enhancement - disabled
> [ 1.661664] Multiprocessor Interrupt Enhancement - disabled
> [ 1.661756] OTG VER PARAM: 0, OTG VER FLAG: 0
> [ 1.661838] Dedicated Tx FIFOs mode
> [ 1.662200] WARN::dwc_otg_hcd_init:1047: FIQ DMA bounce buffers: virt = 0xae814000 dma = 0xee814000 len=9024
> [ 1.662375] FIQ FSM acceleration enabled for :
> [ 1.662375] Non-periodic Split Transactions
> [ 1.662375] Periodic Split Transactions
> [ 1.662375] High-Speed Isochronous Endpoints
> [ 1.662375] Interrupt/Control Split Transaction hack enabled
> [ 1.662714] dwc_otg: Microframe scheduler enabled
> [ 1.662759] WARN::hcd_init_fiq:413: FIQ on core 1 at 0x80448970
> [ 1.662862] WARN::hcd_init_fiq:414: FIQ ASM at 0x80448cd8 length 36
> [ 1.662970] WARN::hcd_init_fiq:439: MPHI regs_base at 0xafcf8000
> [ 1.663120] dwc_otg 3f980000.usb: DWC OTG Controller
> [ 1.663233] dwc_otg 3f980000.usb: new USB bus registered, assigned bus number 1
> [ 1.663377] dwc_otg 3f980000.usb: irq 62, io mem 0x00000000
> [ 1.663513] Init: Port Power? op_state=1
> [ 1.663582] Init: Power Port (0)
> [ 1.663838] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> [ 1.663955] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [ 1.664075] usb usb1: Product: DWC OTG Controller
> [ 1.664158] usb usb1: Manufacturer: Linux 4.4.8-v7 dwc_otg_hcd
> [ 1.664257] usb usb1: SerialNumber: 3f980000.usb
> [ 1.670198] hub 1-0:1.0: USB hub found
> [ 1.675350] hub 1-0:1.0: 1 port detected
> [ 1.681059] dwc_otg: FIQ enabled
> [ 1.681068] dwc_otg: NAK holdoff enabled
> [ 1.681076] dwc_otg: FIQ split-transaction FSM enabled
> [ 1.681113] Module dwc_common_port init
> [ 1.681379] usbcore: registered new interface driver usb-storage
> [ 1.686748] mousedev: PS/2 mouse device common for all mice
> [ 1.692623] bcm2835-cpufreq: min=600000 max=1200000
> [ 1.697982] sdhci: Secure Digital Host Controller Interface driver
> [ 1.703099] sdhci: Copyright(c) Pierre Ossman
> [ 1.708493] sdhost: log_buf @ ae813000 (ee813000)
> [ 1.790106] mmc0: sdhost-bcm2835 loaded - DMA enabled (>1)
> [ 1.797481] mmc-bcm2835 3f300000.mmc: mmc_debug:0 mmc_debug2:0
> [ 1.802608] mmc-bcm2835 3f300000.mmc: DMA channel allocated
> [ 1.847202] mmc0: host does not support reading read-only switch, assuming write-enable
> [ 1.850210] sdhci-pltfm: SDHCI platform and OF driver helper
> [ 1.850608] ledtrig-cpu: registered to indicate activity on CPUs
> [ 1.850721] hidraw: raw HID events driver (C) Jiri Kosina
> [ 1.850897] usbcore: registered new interface driver usbhid
> [ 1.850899] usbhid: USB HID core driver
> [ 1.851459] Initializing XFRM netlink socket
> [ 1.851488] NET: Registered protocol family 17
> [ 1.851623] Key type dns_resolver registered
> [ 1.851987] Registering SWP/SWPB emulation handler
> [ 1.852757] registered taskstats version 1
> [ 1.852932] vc-sm: Videocore shared memory driver
> [ 1.852941] [vc_sm_connected_init]: start
> [ 1.863087] [vc_sm_connected_init]: end - returning 0
> [ 1.863495] 3f201000.uart: ttyAMA0 at MMIO 0x3f201000 (irq = 87, base_baud = 0) is a PL011 rev2
> [ 1.880197] Indeed it is in host mode hprt0 = 00021501
> [ 1.930400] mmc0: new high speed SDHC card at address 59b4
> [ 1.931111] mmcblk0: mmc0:59b4 USD 15.0 GiB
> [ 1.941030] mmcblk0: p1 p2
> [ 1.961177] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
> [ 1.962747] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> [ 1.964307] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> [ 1.967119] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
> [ 2.058017] mmc1: new high speed SDIO card at address 0001
> [ 2.060120] usb 1-1: new high-speed USB device number 2 using dwc_otg
> [ 2.060261] Indeed it is in host mode hprt0 = 00001101
> [ 2.210368] usb 1-1: New USB device found, idVendor=0424, idProduct=9514
> [ 2.210377] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [ 2.211090] hub 1-1:1.0: USB hub found
> [ 2.211175] hub 1-1:1.0: 5 ports detected
> [ 2.490104] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
> [ 2.590353] usb 1-1.1: New USB device found, idVendor=0424, idProduct=ec00
> [ 2.590362] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [ 2.593057] smsc95xx v1.0.4
> [ 2.653495] smsc95xx 1-1.1:1.0 eth0: register 'smsc95xx' at usb-3f980000.usb-1.1, smsc95xx USB 2.0 Ethernet, b8:27:eb:98:b0:5f
> [ 2.730107] usb 1-1.4: new low-speed USB device number 4 using dwc_otg
> [ 2.884657] usb 1-1.4: New USB device found, idVendor=046a, idProduct=0023
> [ 2.884666] usb 1-1.4: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [ 3.095981] console [ttyAMA0] enabled
> [ 3.105211] of_cfs_init
> [ 3.112858] of_cfs_init: OK
> [ 3.121469] uart-pl011 3f201000.uart: no DMA platform data
> [ 3.133274] EXT4-fs (mmcblk0p2): couldn't mount as ext3 due to feature incompatibilities
> [ 3.147362] EXT4-fs (mmcblk0p2): couldn't mount as ext2 due to feature incompatibilities
> [ 3.166558] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
> [ 3.179881] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
> [ 3.194516] devtmpfs: mounted
> [ 3.203257] Freeing unused kernel memory: 476K (807e7000 - 8085e000)
> [ 3.418795] EXT4-fs (mmcblk0p2): re-mounted. Opts: errors=remount-ro,data=ordered
> [ 3.499756] bcm2708_i2c 3f804000.i2c: BSC1 Controller at 0x3f804000 (irq 83) (baudrate 100000)
> [ 3.524733] i2c /dev entries driver
> [ 3.546859] input: HID 046a:0023 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.4/1-1.4:1.0/0003:046A:0023.0001/input/input0
> [ 3.620781] cherry 0003:046A:0023.0001: input,hidraw0: USB HID v1.11 Keyboard [HID 046a:0023] on usb-3f980000.usb-1.4/input0
> [ 3.645171] input: HID 046a:0023 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.4/1-1.4:1.1/0003:046A:0023.0002/input/input1
> [ 3.720363] cherry 0003:046A:0023.0002: input,hidraw1: USB HID v1.11 Device [HID 046a:0023] on usb-3f980000.usb-1.4/input1
> [ 3.791278] random: dd urandom read with 72 bits of entropy available
> [ 3.932219] smsc95xx 1-1.1:1.0 eth0: hardware isn't capable of remote wakeup
> [ 5.351978] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa 0xC5E1
> [ 7.406420] NET: Registered protocol family 10
> [ 10.078639] random: nonblocking pool is initialized
> [ 27.762211] snd-rpi-hifiberry-dacplus soc:sound: ASoC: CPU DAI (null) not registered
> [ 27.775751] snd-rpi-hifiberry-dacplus soc:sound: snd_soc_register_card() failed: -517
>  
> # lsmod
> Module Size Used by Not tainted
> snd_soc_hifiberry_dacplus 3805 0
> snd_soc_core 122215 1 snd_soc_hifiberry_dacplus
> snd_pcm_dmaengine 3334 1 snd_soc_core
> snd_pcm 72905 3 snd_soc_hifiberry_dacplus,snd_soc_core,snd_pcm_dmaengine
> snd_timer 18577 1 snd_pcm
> snd 50262 3 snd_soc_core,snd_pcm,snd_timer
> ipv6 333622 18 [permanent]
> hid_cherry 1393 0
> i2c_dev 5531 0
> i2c_bcm2708 4661 0
> 
> config.txt:
> 
> # enabling HIFIBERRY
> dtoverlay=pi3-disable-bt
> dtoverlay=hifiberry-dacplus
> dtparam=i2c=on
> dtparam=i2s=on
> dtparam=spi=on
> 
> # debugging
> dtdebug=1
> 
>  # i2cdetect -y 1
> 0 1 2 3 4 5 6 7 8 9 a b c d e f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- 4d -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> #
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
