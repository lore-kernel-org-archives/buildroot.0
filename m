From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2019 00:38:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pyqt5: add qt optional
 dependencies
In-Reply-To: <CAPi7W80GTo4EXMoaqu8jbLUAAr+_Z_zvzR_HmLqpoJkQwqiL3Q@mail.gmail.com>
References: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
 <20190819143937.70ecc1d8@windsurf.home>
 <CAPi7W80GTo4EXMoaqu8jbLUAAr+_Z_zvzR_HmLqpoJkQwqiL3Q@mail.gmail.com>
Message-ID: <5ab48cf5-8d93-fb03-872d-19bcf8cf5de1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/08/2019 14:57, Fabrice Fontaine wrote:
> Hello Thomas,
> 
> Le lun. 19 ao?t 2019 ? 14:39, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
>>
>> Hello,
>>
>> On Mon, 19 Aug 2019 00:46:46 +0200
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>>> python-pyqt5 optionally depends on qt5enginio, qt5location,
>>> qt5multimedia, qt5quickcontrols, qt5quickcontrols2, qt5sensors,
>>> qt5serialport, qt5svg, qt5webchannel, qt5webengine, qt5webkit,
>>> qt5websockets and qt5x11extras
>>>
>>> Fixes:
>>>  - https://bugs.buildroot.org/show_bug.cgi?id=12121
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>> Thanks for looking so quickly into this bug report. I also had a look
>> yesterday, and I think we should use the --enable option of PyQT5
>> configure.py script, to force the list of modules we want to enable.
>> This way, if one we enable does not work for some reason, the build
>> will fail instead of silently ignoring it. It also prevents PyQt5 from
>> automatically detecting which modules it should build.

 I really wonder if that is worth the effort.

 The only reason to do this would be to make sure we get the correct result
after changing the Buildroot config even if you don't do a clean build.

 However, maintaining this explicit mapping of modules to packages and options
is very likely to go out of date at some point. And since the --enable option
bypasses the test for availability, that might not even lead to a build error.
In most cases, we install header files unconditionally, and I believe the
libraries get dlopen'ed.

 Oops, but now I realize that the automatic detection won't even work... In many
cases, we install everything to staging, but selectively install to target
depending on Config.in options. So the automatic detection would consider a
module to be available while it doesn't actually get installed to target... Meh.


> I agree that this is a better solution however I'm not sufficiently
> good in Qt to map all the PyQt modules to their respective
> BR2_PACKAGE_QT5xxx variables (for example QtHelp, QtMultimediaWidgets,

 Almost all of them should be pretty obvious, no?

 Anyway, since we copy the libraries manually, you can usually just do a search
for the module (without Qt) in package/qt5. E.g. to find that Nfc is in
connectivity, you can grep for Nfc.

 QtHelp is part of qt5tools but we don't install it.

 QtMultimediaWidgets is part of qt5multimedia and is unconditionally installed.

 Regards,
 Arnout



> ...).
> That's why I decided to just mess with the dependencies (with the
> exception of QtQuick that must be disabled if opengl is not set)
>>
>> Also, on another note, I see we prefeed a qtdetail.out file, but
>> apparently a (better?) alternative is to give a configuration file to
>> PyQt5 configure.py script.
> Again, as I'm not a Qt expert, I also missed this one ;-(.
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
