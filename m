From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 14 Aug 2014 08:40:59 -0400
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <20140813221824.GK3939@free.fr>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140806202322.GE1587@free.fr>
 <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
 <20140811103315.GB4364@free.fr> <20140811105005.GC4364@free.fr>
 <CA+-urNTH1Piz5T+SBkfGzuPHMS_4T=CUwcV8XP3p8vWZfCdDRw@mail.gmail.com>
 <20140813204443.GH3939@free.fr>
 <CA+-urNTFkncEkOxKbyBiqLGAHP=94sfbaz-b-27LnkcvJpkh0g@mail.gmail.com>
 <20140813214910.GJ3939@free.fr> <20140813221824.GK3939@free.fr>
Message-ID: <CA+-urNTfi1--8tOuwaNLHVPS=1Eq3O07T1cX1Qn5XL9NDbzHhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, Aug 13, 2014 at 6:18 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Frank, All,
>
> On 2014-08-13 23:49 +0200, Yann E. MORIN spake thusly:
>> On 2014-08-13 17:23 -0400, Frank Hunleth spake thusly:
>> > > > I think that you can get this error if host erlang is compiled without
>> > > > openssl. Maybe you don't have the openssl headers installed on your
>> > > > system and Johan does?
> [--SNIP--]
>> I re-ran the test with erlang.mk patched to depend on host-openssl and
>> added back the --with-ssl flag when building the host erlang.
>>
>> Indeed, I do not have this directory.
>
> OK, now I have it. My host-erlang is compiled with ssl support.
> But...
>
>> > Also, does the log from Erlang's ./configure provide any clues?
>>
>> Aha!
>>
>>     checking for static ZLib to be used by SSL in standard locations... no
>>     checking for OpenSSL >= 0.9.7 in standard locations... no
>>     configure: WARNING: No (usable) OpenSSL found, skipping ssl, ssh and crypto applications
>>
>> Dang... It seems we have to tell it where to look for our own openssl.
>> Lemme see... Yes, we can say --with-ssl=PATH . I'll try that, and will
>> report later...
>
> Now, my error is back to this sequence of numbers:
>
> Uncaught error in rebar_core: {'EXIT',
>                                {badarg,
>                                 [{re,replace,
>                                   [[40,41,32,123,32,32,108,111,99,97,108,32,
>                                     82,69,84,61,34,36,123,63,125,34,59,10,32,
>                                     108,111,99,97,108,32,105,115,95,110,101,
>                                     116,95,109,110,116,112,116,61,48,59,10,32,
>                                     108,111,99,97,108,32,72,71,80,76,65,73,78,
>                                     59,10,32,108,111,99,97,108,32,76,79,65,68,
> ...
>                                     66,76,85,125,36,123,80,83,49,125,36,123,
>                                     65,95,78,79,82,125,34,59,10,32,104,105,
>                                     115,116,111,114,121,32,45,97,59,10,32,112,
>                                     114,111,109,112,116,95,102,105,114,115,
>                                     116,61,48,10,125],
>                                    [92,36,40,"doPrompt",40,92,115,124,36,41,
>                                     124,123,"doPrompt",125,41],
>                                    [[],"\\2"],
>                                    [global,{return,list}]],
>                                   [{file,"re.erl"},{line,355}]},
>                                  {rebar_port_compiler,merge_each_var,2,
>                                   [{file,"src/rebar_port_compiler.erl"},
>                                    {line,380}]},
>                                  {rebar_port_compiler,setup_env,2,
>                                   [{file,"src/rebar_port_compiler.erl"},
>                                    {line,167}]},
>                                  {rebar_core,'-setup_envs/2-fun-0-',2,
>                                   [{file,"src/rebar_core.erl"},{line,436}]},
>                                  {lists,foldl,3,
>                                   [{file,"lists.erl"},{line,1261}]},
>                                  {rebar_core,process_dir1,6,
>                                   [{file,"src/rebar_core.erl"},{line,190}]},
>                                  {rebar_core,process_commands,2,
>                                   [{file,"src/rebar_core.erl"},{line,61}]},
>                                  {rebar,main,1,
>                                   [{file,"src/rebar.erl"},{line,58}]}]}}
> make[1]: *** [deps/.got] Error 1
>
> OK, I'm lost... :-(
>
> One thing I just noticed, are those two lines (visible above, too):
>
>     [92,36,40,"doPrompt",40,92,115,124,36,41,
>      124,123,"doPrompt",125,41],
>

The lists of numbers are Erlang's way of printing strings when it gets
confused. Presumably your $PROMPT_COMMAND is
"\\$(doPrompt(\\s|$)|{doPrompt})". It looks like rebar is trying to do
a regular expression search and replace in a string that starts with
"() {  local RET=\"${?}\";\n local is_net_mntpt=0;\n local HGPLAIN;\n
local LOAD".

I looked through the rebar source code to see why it would do this,
but ejabberd must have an old version of rebar since it didn't match.
Just as an aside, in the Erlang world, people often copy the
"compiled" version of rebar to their projects so that any one who
wants to build them doesn't have to download and build the build tool.
Rebar has some issues, so many projects have switched back to
Makefiles, but clearly not ejabberd.

I have two thoughts: first is to try to build with a minimal
environment just in case rebar is getting confused on something in
yours (like your prompt settings). The second is to replace the
version of rebar in ejabberd with the latest and greatest in case they
fixed it. See https://github.com/rebar/rebar/releases.

To be honest, this feels like it's getting above and beyond the level
of debug that you should have to do. I have some fondness for Erlang,
so I might try to put in some more time this weekend to figure out
what's going on.

Frank

> doPrompt is the content of my $PROMPT_COMMAND environment variable, in
> case that rings a bell somewhere...
>
> I'll let you guys investigate further. I can run tests if you need to.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
