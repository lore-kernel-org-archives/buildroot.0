From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 9 Sep 2014 12:04:24 +0200
Subject: [Buildroot] General questions
In-Reply-To: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
References: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
Message-ID: <CAAXf6LXwNYVB6VzNT=FNt1DOA=uowhA6DEB-9-8JoAjoiO_m2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sylvain,

On Tue, Sep 9, 2014 at 11:20 AM, Sylvain LG <forum@sylvainlegourr.com> wrote:
> Hi,
>
> I develop some projects with Qt and run them on ARM embedded systems. OS is
> built by Buildroot.
>
> Since Qt 5.3.1 and QtCreator 3, GDB must support Python scripting.
>
> ?The selected build of GDB does not support Python scripting it cannot be
> used in Qt Creator?
>
>
> I have to recompile gdb with these options:
>
> ./configure --prefix /usr/local/gdb-python2 --with-python
>
> What is the right way to achieve this?

In package/gdb/gdb.mk, you will have to update the HOST_GDB_CONF_OPT variable.
You shouldn't add --prefix, but only the --with-python flag.
Since not everyone will want this python dependency, you probably
should add an option for this. This is done in
package/gdb/Config.in.host

I suggest to have a look at the recent TUI support that was added in
Buildroot for GDB, I think that the way to handle python support is
very similar, except that instead of host-ncurses as dependency,
you'll add host-python.
Additionally, from the Config.in.host file, you'll have to select
BR2_PACKAGE_PYTHON. Due to this, you'll also need to propagate the
dependencies of python (seen in package/python/Config.in) as
dependencies of your new gdb-python-support option.
Have a look at http://buildroot.uclibc.org/downloads/manual/manual.html#_literal_config_in_literal_file
for this part.

>
> Could someone give me the guideline to contribute to Buildroot?

In general, there is some documentation at
http://buildroot.uclibc.org/downloads/manual/manual.html#_developer_guide
Specifically for adding packages (or modifying existing packages), see
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages
.

Best regards,
Thomas
