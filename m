From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Feb 2017 21:24:34 +0100
Subject: [Buildroot] [PATCH v6 0/9] bump/choice for qt 5.8.0
In-Reply-To: <0ac2d242-962a-9293-4690-d51e0b7031e0@andin.de>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170206164058.3f443334@free-electrons.com>
 <0ac2d242-962a-9293-4690-d51e0b7031e0@andin.de>
Message-ID: <d086f97e-ac3d-6046-55fc-caf22e21d9e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-17 18:44, Andreas Naumann wrote:
> Hi,
> 
> first of all, thanks everybody for taking over and pushing this further. My
> finding on this below..
> 
> Am 06.02.2017 um 16:40 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Tue, 31 Jan 2017 08:59:02 +0100, Zoltan Gyarmati wrote:
>>
>>> The Qt 5.8 config (and pyqt5) was tested on Raspberry Pi.
>>
>> As Arnout said we are trying to apply this patch series (or actually a
>> subset of it). We have already fixed the comments that people have
>> raised, and you can see the result at:
>>
>>   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=qt5-bump
>>
>> Unfortunately, this fails to build with the following defconfig:
>>
>> BR2_arm=y
>> BR2_cortex_a8=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_QT5=y
>> BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>> BR2_PACKAGE_QT5DECLARATIVE=y
>> BR2_PACKAGE_QT5IMAGEFORMATS=y
>> BR2_PACKAGE_QT5LOCATION=y
>> BR2_PACKAGE_QT5MULTIMEDIA=y
>> BR2_PACKAGE_QT5SENSORS=y
>> BR2_PACKAGE_QT5SERIALBUS=y
>> BR2_PACKAGE_QT5SVG=y
>> BR2_PACKAGE_QT5TOOLS=y
>> BR2_PACKAGE_QT5TOOLS_PIXELTOOL=y
>> BR2_PACKAGE_QT5TOOLS_QTDIAG=y
>> BR2_PACKAGE_QT5TOOLS_QTPATHS=y
>> BR2_PACKAGE_QT5TOOLS_QTPLUGININFO=y
>> BR2_PACKAGE_QT5WEBCHANNEL=y
>> BR2_PACKAGE_QT5ENGINIO=y
>>
>> With the following error message during the qt5base build:
>>
>>   Project ERROR: Library 'libpng' is not defined.
>>
>> Could you take our branch, and see why there is this build failure ?
> 
> I have tried your branch and defconfig and see the same failure. Unfortunately I
> have no idea why it happens, I have never observed that problem.
> 
> There are reports about these kind of problem, but without a hint for the real
> reason.
> https://bugreports.qt.io/browse/QTBUG-57148

 That's something else, it happens while building the bundled freetype which we
don't do.

> https://bugreports.qt.io/browse/QTBUG-57794

 That one looks like the same issue.

> 
> After fiddling a little, I can get over it by selecting
> BR2_PACKAGE_QT5BASE_FONTCONFIG. Unfortunately I run out of time debugging
> further for now.

 Since it would be really nice to have Qt5.8 in 2017.02, I wouldn't mind working
around it with

	# Not clear why this is needed, the build fails without it
	select BR2_PACKAGE_QT5BASE_FONTCONFIG if BR2_PACKAGE_QT5_VERSION_LATEST

to BR2_PACKAGE_QT5BASE_PNG. Thomas and I looked at it as well for a little while
and couldn't come up with an explanation.

 It would be good however to report our findings in QTBUG-57794.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
