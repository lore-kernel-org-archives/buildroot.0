From: =?ISO-8859-2?Q?Wojciech_Sle=F1ska?= <wojciech.slenska@gmail.com>
Date: Tue, 28 May 2013 10:20:30 +0200
Subject: [Buildroot] [PATCH] qt5: mysql and sqlite plugins
In-Reply-To: <51A3AE7A.9080005@mind.be>
References: <1369343084-1925-1-git-send-email-wojciech.slenska@gmail.com>
 <51A3AE7A.9080005@mind.be>
Message-ID: <CAMYPSMpeOsG5iwRVobvwO8xAo4BCq099wCfLN_ZkbwCWETFa0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Thanks for Your comment. I will change this long line to if - else construction.

Best Regards
Wojciech

2013/5/27 Arnout Vandecappelle <arnout@mind.be>:
> On 23/05/13 23:04, Wojciech Slenska wrote:
>>
>> Added support for mysql and sqlite plugins. Configuration is based on qt
>> package.
>>
>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  (untested)
>
>  One minor comment below.
>
>
>> ---
>>   package/qt5/qt5base/Config.in  | 36 ++++++++++++++++++++++++++++++++++++
>>   package/qt5/qt5base/qt5base.mk | 11 +++++++++++
>>   2 files changed, 47 insertions(+)
>>
>> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
>> index 7974357..9c7fd15 100644
>> --- a/package/qt5/qt5base/Config.in
>> +++ b/package/qt5/qt5base/Config.in
>> @@ -43,6 +43,42 @@ config BR2_PACKAGE_QT5BASE_SQL
>>         help
>>           This options enables the Qt5Sql library.
>>
>> +if BR2_PACKAGE_QT5BASE_SQL
>> +config BR2_PACKAGE_QT5BASE_MYSQL
>> +       bool "MySQL Plugin"
>> +       select BR2_PACKAGE_MYSQL_CLIENT
>> +       select BR2_PACKAGE_NCURSES
>> +       select BR2_PACKAGE_READLINE
>> +       depends on BR2_USE_MMU # mysql
>> +       help
>> +         Build MySQL plugin
>> +         If unsure, say n.
>> +choice
>> +       prompt "SQLite 3 support"
>> +       default BR2_PACKAGE_QT5BASE_SQLITE_NONE
>> +       help
>> +         Select SQLite support.
>> +
>> +config BR2_PACKAGE_QT5BASE_SQLITE_NONE
>> +       bool "No sqlite support"
>> +       help
>> +         Do not compile any kind of SQLite support.
>> +
>> +config BR2_PACKAGE_QT5BASE_SQLITE_QT
>> +       bool "Qt SQLite"
>> +       help
>> +         Use Qt bundled SQLite support.
>> +
>> +config BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM
>> +       bool "System SQLite"
>> +       select BR2_PACKAGE_SQLITE
>> +       help
>> +         Use system SQLite.
>> +
>> +endchoice
>> +
>> +endif
>> +
>>   config BR2_PACKAGE_QT5BASE_TEST
>>         bool "test module"
>>         help
>> diff --git a/package/qt5/qt5base/qt5base.mk
>> b/package/qt5/qt5base/qt5base.mk
>> index bfc6c91..5b0596d 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -60,6 +60,17 @@ QT5BASE_LICENSE = Commercial license
>>   QT5BASE_REDISTRIBUTE = NO
>>   endif
>>
>> +# Qt5 SQL Plugins
>> +ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
>> +QT5BASE_CONFIGURE_OPTS += $(if
>> $(BR2_PACKAGE_QT5BASE_MYSQL),-plugin-sql-mysql -mysql_config
>> $(STAGING_DIR)/usr/bin/mysql_config,-no-sql-mysql)
>
>
>  Please split this long line. Actually, an ifeq - else construct seems more
> appropriate in this case.
>
>  Regards,
>  Arnout
>
>
>> +QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_MYSQL),mysql_client)
>> +
>> +QT5BASE_CONFIGURE_OPTS += $(if
>> $(BR2_PACKAGE_QT5BASE_SQLITE_QT),-plugin-sql-sqlite)
>> +QT5BASE_CONFIGURE_OPTS += $(if
>> $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),-system-sqlite)
>> +QT5BASE_DEPENDENCIES   += $(if
>> $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
>> +QT5BASE_CONFIGURE_OPTS += $(if
>> $(BR2_PACKAGE_QT5BASE_SQLITE_NONE),-no-sql-sqlite)
>> +endif
>> +
>>   # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
>>   # is to add a link against the "inuxfb" library.
>>   QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
