From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 2 Jun 2020 22:33:28 +0200
Subject: [Buildroot] Cross-compile mariadb-connector-c for MySQL use
In-Reply-To: <CADJjDh_2Uhs7bTefPUhvEZedWnXyekZ1dR5Z5DOVtvfoLfqK_g@mail.gmail.com>
References: <CADJjDh_2Uhs7bTefPUhvEZedWnXyekZ1dR5Z5DOVtvfoLfqK_g@mail.gmail.com>
Message-ID: <20200602223328.26e660f6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Todd,

On Tue, 2 Jun 2020 15:47:34 -0400, Todd Sampson <sampsonats@gmail.com> wrote:

> I want to cross-compile mariadb-connector-c to link with the Poco library
> to create a MySQL client.
>
> Everything was working with mariadb-connector-c version 2.3.7.  I need to
> update to 3.1.8 for compatibility with MySQL version 8.  When I changed the
> mariadb-connector-c  buildroot target to 3.1.8, the build failed because
> mariadb-connector-c had more dependencies.
>
> It seems like mariadb-connector-c depends on the mariadb server to be
> built.  If I build the server, mariadb-connector-c is happy.  The problem
> is, the mariadb server is installed on the target and there is no room for
> it.
>
> I tried putting:
>
> > MARIADB_INSTALL_TARGET = NO
>
> in the mariadb server .mk file but it still was installed.
>
> If I don't select mariadb server, I get these errors and lots more similar:
>
> home/dfr/m9k2/buildroot/output/host/lib/gcc/powerpc-buildroot-linux-gnu/8.4.0/../../../../powerpc-buildroot-linux-gnu/bin/ld:
> > /home/dfr/m9k2/buildroot/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/mariadb/libmariadbclient.a(openssl.c.o):
> > in function `ma_tls_set_error':
> > openssl.c:(.text+0x28): undefined reference to `ERR_get_error'
> > /home/dfr/m9k2/buildroot/output/host/lib/gcc/powerpc-buildroot-linux-gnu/8.4.0/../../../../powerpc-buildroot-linux-gnu/bin/ld:
> > openssl.c:(.text+0x64): undefined reference to `ERR_reason_error_string'
>
>
> *buildroot version 2020.05*
> *QUESTIONS*
> 1. Is there a better way to approach this?
> 2. How do I let mariadb server be built but *not *installed in the target?
> 3. Should I be able to use the Poco library built into buildroot? It seems
> like there should be an option in Poco to build the mariadb-connector-c
> library and just work.
> 4. Is anyone else in the world besides me trying to do this?
>
> I've been working on this for over two weeks now.  I sure would appreciate
> any help!

First thing to do is support the buildroot people by providing your config (or defconfig)
file which produces your problem (against a vanilla buildroot release or git tree, so
other people can try to re-produce your problem)...

Try to reproduce your problem with an complete re-build (make clean && make), see [1]

As far as I can see in the builroot-2020.05 source mariadb is at version 10.3.23,
where does your 2.3.7, 3.1.8 and MySQL version 8 come from?

According to [2] mariadb-connector-c is included in mariadb-10.3.23 and
the buildroot package poco mysql component (BR2_PACKAGE_POCO_DATA_MYSQL) simple
selects BR2_PACKAGE_MYSQL....do your try to build some packages outside of
buildroot? If yes...why?

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#full-rebuild
[2] https://mariadb.com/kb/en/mariadb-connector-c-318-release-notes/

> Thanks
