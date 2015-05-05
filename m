From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 05 May 2015 13:00:41 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150504233058.2e5e1a59@free-electrons.com>
References: <20150502063016.3950D100FB0@stock.ovh.net>	<20150503105009.2b42c375@free-electrons.com>	<87h9rtucot.fsf@dell.be.48ers.dk>	<878ud4qwl8.fsf@dell.be.48ers.dk>	<CACQ1gAiHWPPCABQL5JSGUabkbu5dYOZ5dWo7Sn_Bpc+X7CfmdQ@mail.gmail.com>
 <20150504233058.2e5e1a59@free-electrons.com>
Message-ID: <5548A2D9.8020900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/2015 23:30, Thomas Petazzoni wrote:
> Dear Richard Genoud,
> 
> On Mon, 4 May 2015 16:57:59 +0200, Richard Genoud wrote:
> 
>>>  > We currently only allow BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE for soft
>>>  > float toolchains, but perhaps it needs to also be disallowed for mips64?
>>>  > Richard, care to take a look?
>>>
>>> QT_COORD_TYPE_DOUBLE also causes issues with python-pyqt because of
>>> qreal* -> float* conversion. Could you take a look?
>>>
>>> http://autobuild.buildroot.net/results/891/891dc6ad46039740867a0b436281fc489cfb2772/build-end.log
>>
>> yes, no problem.
> 
> And I also believe
> http://autobuild.buildroot.org/results/3a7/3a70305be4a78af9404b0bd027dbcdd011ca01b3/build-end.log
> is caused by BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE:
> 
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QPen::setWidthF(float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QTransform::translate(float, float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QMatrix::setMatrix(float, float, float, float, float, float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QTransform::rotate(float, Qt::Axis)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QColor::setRgbF(float, float, float, float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QPen::setDashOffset(float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QColor::setAlphaF(float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QPen::setMiterLimit(float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QTransform::QTransform(float, float, float, float, float, float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QColor::setCmykF(float, float, float, float, float)'
> ../../qt4/src/.libs/libpoppler-qt4.so: undefined reference to `QPen::setDashPattern(QVector<float> const&)'
> 
> The libpoppler code is expecting "float" arguments for all these
> functions, but they are now taking "double" instead.
> 
> Seems like using a double type is breaking a lot of assumptions of
> existing applications and libraries. Do we really want to support this
> option?
> 
> I would personally suggest to revert the patch for now in 2015.05, and
> take the time to make sure it is properly tested with all the Qt-based
> libraries and applications.
> 
> Richard, what do you think?

Ok, I've found the right Config.in depends to set to BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE.
It shouldn't break in any arch now.
I also corrected the breakage with python-pyqt.

BUT, there's still some packages (at least poppler and pinentry (I started to compile more packages, but my internet liaison at work stalls quite often))
that are breaking when BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE is set.
The reason is that those packages are not using qmake, so the -DQT_COORD_TYPE=double doesn't appear in their CFLAGS/CXXFLAGS.
So, for all packages that use Qt but not qmake, the CFLAGS/CXXFLAGS have to be appended with -DQT_COORD_TYPE=double

That said, this option was originally created for QWT (http://qwt.sourceforge.net/ ):
The problem was that QWT uses qreals to draw its curves/plots/... and when you want to have dates(QwtDate) on an axe, the dates are converted to qreal,
and if qreal is float, the precision is not enough (not even by a day).
So, forcing qreal to float seems a good solution.


Given the fact that 2015.05 is close, and that there's quite some packages to test with this option (and that it's not a huge feature-killer), I agree with
Thomas for reverting it.

For reference, I'm pasting the patch I've come with to prevent breaking any architecture.
