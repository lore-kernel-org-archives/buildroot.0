From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:51:57 +0200
Subject: [Buildroot] Installing libpq
In-Reply-To: <CAJoXuZgkk+nLFHJixMHuFpSDJQTM=G9sJu0TRN9TV2a4+xkYrA@mail.gmail.com>
References: <CAJoXuZgkk+nLFHJixMHuFpSDJQTM=G9sJu0TRN9TV2a4+xkYrA@mail.gmail.com>
Message-ID: <55DB83ED.60901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/16/2015 01:59 PM, Chris Reeves wrote:
> Hi
> 
> I'm new to using buildroot, trying to create some lightweight containers. My
> application requires libpq in order to install psycopg2. I don't really want to
> install al of Postgres to get it so I had a go at creating a package that is
> basically the equivalent too libpq-dev in the liks of Ubuntu and Debian.

 For something like this, you don't want to create a new package. Instead, you
should add options to the postgresql package to build just the library or also
the server (see libidn for a simple example).


[snip]
> '/tmp/buildroot/output/build/libpq-9.4.4/src/interfaces/libpq'
> /bin/mkdir -p '/tmp/buildroot/output/target/usr/lib'
> '/tmp/buildroot/output/target/usr/lib/pkgconfig'
> /bin/mkdir -p '/tmp/buildroot/output/target/usr/include'
> '/tmp/buildroot/output/target/usr/include/postgresql/internal'
> '/tmp/buildroot/output/target/usr/share/postgresql'
> /usr/bin/install -c -m 755  libpq.so.5.7
> '/tmp/buildroot/output/target/usr/lib/libpq.so.5.7'
> cd '/tmp/buildroot/output/target/usr/lib' && \
> rm -f libpq.so.5 && \
> ln -s libpq.so.5.7 libpq.so.5
> /usr/bin/install -c -m 644  libpq.a '/tmp/buildroot/output/target/usr/lib/libpq.a'
> /usr/bin/install -c -m 644 libpq.pc
> '/tmp/buildroot/output/target/usr/lib/pkgconfig/libpq.pc'
> cd '/tmp/buildroot/output/target/usr/lib' && \
> rm -f libpq.so && \
> ln -s libpq.so.5.7 libpq.so
> /usr/bin/install -c -m 644 ./libpq-fe.h '/tmp/buildroot/output/target/usr/include'
> /usr/bin/install -c -m 644 ./libpq-events.h
> '/tmp/buildroot/output/target/usr/include'
> /usr/bin/install -c -m 644 ./libpq-int.h
> '/tmp/buildroot/output/target/usr/include/postgresql/internal'
> /usr/bin/install -c -m 644 ./pqexpbuffer.h
> '/tmp/buildroot/output/target/usr/include/postgresql/internal'
> /usr/bin/install -c -m 644 ./pg_service.conf.sample
> '/tmp/buildroot/output/target/usr/share/postgresql/pg_service.conf.sample'
> make[1]: Leaving directory
> '/tmp/buildroot/output/build/libpq-9.4.4/src/interfaces/libpq'
> 
> However the files I expect like the .so's and the headers don't end up in the
> rootfs.

 That the headers don't appear in the rootfs is normal: they are removed by
buildroot. Since your target doesn't have a compiler, the headers are useless.

 However, the .so library should still be there. If not, the server wouldn't
even be able to run...



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
