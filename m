From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 7 Jan 2014 15:11:16 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 02/10] luajit: allow to
 build Lua extensions without lua
In-Reply-To: <20131222182356.6ab0d7ed@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-2-git-send-email-francois.perrad@gadz.org>
 <20131222182356.6ab0d7ed@skate>
Message-ID: <CAB0FRsvz8TZAm3NUkf6nsR12uB1ypVYnwiq+ZDpD--xo0uG64w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 15 Nov 2013 14:07:31 +0100, Francois Perrad wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/luajit/luajit-05-install-inc.patch |   17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 package/luajit/luajit-05-install-inc.patch
>
> I don't understand what are the consequence of this patch or why it is
> needed. Could you expand the commit log a little bit?
>

A Lua native module, like LuaFileSystem, needs the Lua includes at compile time.
Both lua package and luajit package supply these files.
The lua package installs them in /usr/include, and luafilesystem, like
other Lua modules, expects them at this place.
In LuaJIT upstream, these files are installed
/usr/include/luajit-2.0.2 in order to not override the Lua ones if
they are already installed.
Before the introduction of virtual package luainterpreter,
luafilesystem depends on lua package.
Now, it depends on luainterpreter. When luainterpreter is supplied by
luajit, the include from LuaJIT must be installed in the same place as
Lua one's.

So, the patch luajit-05-install-inc.patch contains the comment :
"Install includes like lua's ones"

Fran?ois

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
