From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 23:26:48 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
 <20180825230514.1f0264dd@windsurf>
Message-ID: <o5u85fxpst.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 25 Aug 2018 23:05:14 +0200 schrieb Thomas Petazzoni:

> We changed from -DWITH_SSL=bundled to -DWITH_SSL=OFF very recently, in
> commit 9276747defdd4f91ec21ba0930afdf6d947730b6. Do we really need SSL
> support in the host mariadb build ?

will test, thanks for the hint.

>> This bump also fixes broken atomic support for
>> BR2_TOOLCHAIN_HAS_LIBATOMIC=y with mariadb-10.2:
>> 
>> [ 59%] Linking CXX executable mariabackup
>> ../../storage/innobase/libinnobase.a(handler0alter.cc.o): In function
>> `my_atomic_add64':
>> /home/bernd/buildroot/output/build/mariadb-10.2.17/include/my_atomic.h:
274:
>> undefined reference to `__sync_fetch_and_add_8'
> 
> Is it the bump that fixes the atomic issue, or the fact that this patch
> adds the logic to link against libatomic when needed ?

Both ;)

In unpatched next branch the build on arc fails with
"error atomic ops for this platform are not implemented", no cxxflags nor 
CONF_OPTS will solve that.

Only when bumping to 10.3 you get past this build error just to see the 
"undefined reference to `__sync_fetch_and_add_8'" error later on.
To solve this the changes in this patch are needed.

Regards, Bernd
