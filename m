From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Sep 2014 23:27:14 +0200
Subject: [Buildroot] General questions
In-Reply-To: <CAAXf6LXwNYVB6VzNT=FNt1DOA=uowhA6DEB-9-8JoAjoiO_m2Q@mail.gmail.com>
References: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
 <CAAXf6LXwNYVB6VzNT=FNt1DOA=uowhA6DEB-9-8JoAjoiO_m2Q@mail.gmail.com>
Message-ID: <541759B2.8050500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/09/14 12:04, Thomas De Schampheleire wrote:
> Hi Sylvain,
> 
> On Tue, Sep 9, 2014 at 11:20 AM, Sylvain LG <forum@sylvainlegourr.com> wrote:
>> Hi,
>>
>> I develop some projects with Qt and run them on ARM embedded systems. OS is
>> built by Buildroot.
>>
>> Since Qt 5.3.1 and QtCreator 3, GDB must support Python scripting.
>>
>> ?The selected build of GDB does not support Python scripting it cannot be
>> used in Qt Creator?
>>
>>
>> I have to recompile gdb with these options:
>>
>> ./configure --prefix /usr/local/gdb-python2 --with-python
>>
>> What is the right way to achieve this?
> 
> In package/gdb/gdb.mk, you will have to update the HOST_GDB_CONF_OPT variable.
> You shouldn't add --prefix, but only the --with-python flag.
> Since not everyone will want this python dependency, you probably
> should add an option for this. This is done in
> package/gdb/Config.in.host
> 
> I suggest to have a look at the recent TUI support that was added in
> Buildroot for GDB, I think that the way to handle python support is
> very similar, except that instead of host-ncurses as dependency,
> you'll add host-python.

 I'm not sure that we want our own-build host-python... You may want to use some
of the system's python packages, for example. So I think it is better to drop
the host-python dependency, and use the system python instead. (Note that python
is a dependency of buildroot.)


> Additionally, from the Config.in.host file, you'll have to select
> BR2_PACKAGE_PYTHON. Due to this, you'll also need to propagate the

 Huh? We are talking about the host-gdb here, so why do you need a target python?


 One more thing: on AVR we still use gdb 6.7 which doesn't have python support,
so something must be done to catch that.


 Regards,
 Arnout

> dependencies of python (seen in package/python/Config.in) as
> dependencies of your new gdb-python-support option.
> Have a look at http://buildroot.uclibc.org/downloads/manual/manual.html#_literal_config_in_literal_file
> for this part.

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
