From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Jul 2015 23:53:06 +0200
Subject: [Buildroot] [PATCH 3/7 v2] galera: new package
In-Reply-To: <CAHXCMML5sejdn7saGW8znTAGdDzAUcE-Y4TVQT0ttSJDt4whqg@mail.gmail.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-4-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMML5sejdn7saGW8znTAGdDzAUcE-Y4TVQT0ttSJDt4whqg@mail.gmail.com>
Message-ID: <559EED42.8010609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/15 23:29, Samuel Martin wrote:
> Hi Sylvain,
> 
> On Thu, Jul 9, 2015 at 6:21 PM, Sylvain Raybaud
> <sylvain.raybaud@green-communications.fr> wrote:
>> Add package galera: wsrep provider for MySQL and MariaDB galera cluster.
>>
>> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
>> ---
>> Changes v1 -> v2:
>>  - Remove duplicated block in package/galera/galera.mk
>>
>>  package/Config.in                                  |  1 +
>>  package/galera/Config.in                           |  9 ++++
>>  ...lera-01-fix_sconstruct_for-crosscompiling.patch | 52 ++++++++++++++++++++++
>>  package/galera/galera.hash                         |  2 +
>>  package/galera/galera.mk                           | 49 ++++++++++++++++++++
>>  5 files changed, 113 insertions(+)
>>  create mode 100644 package/galera/Config.in
>>  create mode 100644 package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
>>  create mode 100644 package/galera/galera.hash
>>  create mode 100644 package/galera/galera.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 72ec372..b15d026 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -740,6 +740,7 @@ menu "Database"
>>         source "package/cppdb/Config.in"
>>         source "package/gdbm/Config.in"
>>         source "package/leveldb/Config.in"
>> +       source "package/galera/Config.in"
>>         source "package/mysql/Config.in"
>>         source "package/postgresql/Config.in"
>>         source "package/redis/Config.in"
>> diff --git a/package/galera/Config.in b/package/galera/Config.in
>> new file mode 100644
>> index 0000000..4c50427
>> --- /dev/null
>> +++ b/package/galera/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_GALERA
>> +       bool "galera"
>> +       select BR2_PACKAGE_BOOST
>> +       select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>> +       select BR2_PACKAGE_OPENSSL
>> +       select BR2_PACKAGE_CHECK
>> +       help
>> +         Galera WSREP provider
>> +         http://galeracluster.com/
>> diff --git a/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
>> new file mode 100644
>> index 0000000..25c9d59
>> --- /dev/null
>> +++ b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
>> @@ -0,0 +1,52 @@
>> +Fix cross compilation
>> +
>> +--- a/SConstruct       2015-05-28 12:23:41.027461788 +0200
>> ++++ b/SConstruct       2015-07-02 11:27:55.763337287 +0200
>> +@@ -15,18 +15,17 @@
>> + ####################################################################
>> +
>> + import os
>> +-import platform
>> + import string
>> +
>> +-sysname = os.uname()[0].lower()
>> +-machine = platform.machine()
>> +-bits = platform.architecture()[0]
>> ++sysname = "linux"
>> ++machine = os.environ['BR2_ARCH']
>> ++bits = os.environ['BR2_x86']
>> + print 'Host: ' + sysname + ' ' + machine + ' ' + bits
>> +
>> + x86 = 0
>> +-if bits == '32bit':
>> ++if bits == '32':
>> +     x86 = 32
>> +-elif bits == '64bit':
>> ++elif bits == '64':
>> +     x86 = 64
>> +
>> +
>> +@@ -240,6 +239,15 @@
>> + #
>> + env.Append(LINKFLAGS = link_arch)
>> +
>> ++# Cross-compilation
>> ++
>> ++if 'CROSS' in os.environ:
>> ++        cross = os.environ['CROSS']
>> ++        env.Append(CROSS = cross)
>> ++        env.Replace(CC = cross + 'gcc')
>> ++        env.Replace(CXX = cross + 'g++')

 This means ccache will not be used. We prefer to pass CC and CXX in the
environment (through TARGET_CONFIGURE_OPTS). I think that would even work out of
the box without any patch, no?

>> ++        env.Replace(LD = cross + 'ld')
>> ++
>> + #
>> + # Check required headers and libraries (autoconf functionality)
>> + #
>> +@@ -405,7 +413,7 @@
>> +
>> + # these will be used only with our softaware
>> + if strict_build_flags == 1:
>> +-    conf.env.Append(CPPFLAGS = ' -Werror')
>> ++    conf.env.Append(CPPFLAGS = ' -Werror -Wno-error=uninitialized -Wno-error=pedantic')
> Hum... -Werror is more a development flag than an integration one. It
> should certainly be removed.

 Better yet, make sure the strict_build_flags is not set.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
