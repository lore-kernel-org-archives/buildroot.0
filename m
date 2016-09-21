From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 21 Sep 2016 19:22:42 +0000
Subject: [Buildroot] Qt5WebKit anf gcc 6.x
In-Reply-To: <20160921210949.7ce47d0c@free-electrons.com>
References: <1474471693.4311.28.camel@synopsys.com>
 <20160921210949.7ce47d0c@free-electrons.com>
Message-ID: <1474485754.5453.8.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-09-21 at 21:09 +0200, Thomas Petazzoni wrote:
> 
> Hello,
> 
> On Wed, 21 Sep 2016 15:28:21 +0000, Alexey Brodkin wrote:
> 
> > 
> > 
> > In its turn "-isystem XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include"
> > appears in ICU's check Makefile because
> > --------------------->8-------------------??
> > ./pkg-config_wrapper.sh --cflags icu-i18n
> > -IXXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
> > --------------------->8-------------------??
> > and that include path matches with one entry from?QMAKE_DEFAULT_INCDIRS.
> > In that case qmake makes an assumption that it's a system path and adds "-isystem".
> 
> Are you sure about this? I don't see this happening anywhere in the
> qmake source code. I do see some isystem related code around
> QMAKE_CFLAGS_ISYSTEM and INCLUDEPATH.

Take a look here:?https://github.com/qt/qtbase/blob/dev/qmake/generators/unix/unixmake2.cpp#L179
That's what I mean:
--------------------->8-------------------
? ? t << "####### Compiler, tools and options\n\n";
????t << "CC????????????= " << var("QMAKE_CC") << endl;
????t << "CXX???????????= " << var("QMAKE_CXX") << endl;
????t << "DEFINES???????= "
??????<< varGlue("PRL_EXPORT_DEFINES","-D"," -D"," ")
??????<< varGlue("DEFINES","-D"," -D","") << endl;
????t << "CFLAGS????????= " << var("QMAKE_CFLAGS") << " $(DEFINES)\n";
????t << "CXXFLAGS??????= " << var("QMAKE_CXXFLAGS") << " $(DEFINES)\n";
????t << "INCPATH???????=";
????{
????????QString isystem = var("QMAKE_CFLAGS_ISYSTEM");
????????const ProStringList &incs = project->values("INCLUDEPATH");
????????for(int i = 0; i < incs.size(); ++i) {
????????????const ProString &inc = incs.at(i);
????????????if (inc.isEmpty())
????????????????continue;

????????????if (!isystem.isEmpty() && isSystemInclude(inc.toQString()))
????????????????t << ' ' << isystem << ' ';
????????????else
????????????????t << " -I";
????????????t << escapeFilePath(inc);
????????}
????}
--------------------->8-------------------

For G++ "QMAKE_CFLAGS_ISYSTEM = -isystem", see?https://github.com/qt/qtbase/blob/dev/mkspecs/common/gcc-base.conf#L47

That's how include path gets prefixed with either normal "-I" if path has no matches in
QMAKE_DEFAULT_INCDIRS otherwise "-isystem " prefix is used.

> 
> In any case, I believe this is where the problem is: I don't see why
> Qt5 should mess up with the addition of -isystem flags.

Agree, but see what Qt people say in similar bug reports:
https://bugreports.qt.io/browse/QTBUG-53367
https://bugreports.qt.io/browse/QTBUG-53375

And BTW that commit added all this mess:
http://code.qt.io/cgit/qt/qtbase.git/commit?id=0b144bc76a368ecc6c5c1121a1b51e888a0621ac

-Alexey
