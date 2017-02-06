From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Feb 2017 14:32:27 +0100
Subject: [Buildroot] [PATCH v6 1/9] qt5: add choice between version
 5.6.2 and 5.8.0
In-Reply-To: <20170202203106.10275402@gmx.net>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170202203106.10275402@gmx.net>
Message-ID: <fdf57f1e-5798-ebad-06c6-28cb5348cead@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-02-17 20:31, Peter Seiderer wrote:
> Hello *,
> 
> On Tue, 31 Jan 2017 08:59:03 +0100, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:
> 
> [...]
>> - qt5base: remove gstreamer related config-option ([5])
>>
> [...]
>> [5]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=7d4da559afb62a779b3d90a65fb679cb5433f203
>>
> [...]
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index bbbaf0f..c09bf58 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -41,12 +41,19 @@ else
> [...]
>>  
>>  # gstreamer 0.10 support is broken in qt5multimedia
>> +ifeq ($(BR2_QT5_VERSION_5_6),y)
>>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>>  QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
>>  QT5BASE_DEPENDENCIES   += gst1-plugins-base
>>  else
>>  QT5BASE_CONFIGURE_OPTS += -no-gstreamer
>>  endif
>> +endif
> 
> I think this configuration options should go to qt5multimedia.mk for
> the Qt5.8 (or not !Qt5.6) case...

 Just to clarify: qt5multimedia.mk now has:

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
endif

i.e. it doesn't explicitly tell qmake whether or not gstreamer should be
enabled. We prefer to explicitly pass enable/disable options to the
configuration step, to avoid accidental use of a package that wasn't meant to be
used. So Zoltan, Andreas, or Peter: could you make a patch that does that?

 Note that the series can already be applied without that patch.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
