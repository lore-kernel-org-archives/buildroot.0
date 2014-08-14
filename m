From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 00:36:52 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CA+-urNTfi1--8tOuwaNLHVPS=1Eq3O07T1cX1Qn5XL9NDbzHhQ@mail.gmail.com>
References: <20140806202322.GE1587@free.fr>
 <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
 <20140811103315.GB4364@free.fr> <20140811105005.GC4364@free.fr>
 <CA+-urNTH1Piz5T+SBkfGzuPHMS_4T=CUwcV8XP3p8vWZfCdDRw@mail.gmail.com>
 <20140813204443.GH3939@free.fr>
 <CA+-urNTFkncEkOxKbyBiqLGAHP=94sfbaz-b-27LnkcvJpkh0g@mail.gmail.com>
 <20140813214910.GJ3939@free.fr> <20140813221824.GK3939@free.fr>
 <CA+-urNTfi1--8tOuwaNLHVPS=1Eq3O07T1cX1Qn5XL9NDbzHhQ@mail.gmail.com>
Message-ID: <20140814223652.GA3837@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

Thanks for all the help so far! :-)

On 2014-08-14 08:40 -0400, Frank Hunleth spake thusly:
> On Wed, Aug 13, 2014 at 6:18 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2014-08-13 23:49 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> > Now, my error is back to this sequence of numbers:
> >
> > Uncaught error in rebar_core: {'EXIT',
> >                                {badarg,
> >                                 [{re,replace,
> >                                   [[40,41,32,123,32,32,108,111,99,97,108,32,
> >                                     82,69,84,61,34,36,123,63,125,34,59,10,32,
> >                                     108,111,99,97,108,32,105,115,95,110,101,
> > ...
> >                                     115,116,111,114,121,32,45,97,59,10,32,112,
> >                                     114,111,109,112,116,95,102,105,114,115,
> >                                     116,61,48,10,125],
> >                                    [92,36,40,"doPrompt",40,92,115,124,36,41,
[--SNIP--]
> The lists of numbers are Erlang's way of printing strings when it gets
> confused. Presumably your $PROMPT_COMMAND is
> "\\$(doPrompt(\\s|$)|{doPrompt})". It looks like rebar is trying to do
> a regular expression search and replace in a string that starts with
> "() {  local RET=\"${?}\";\n local is_net_mntpt=0;\n local HGPLAIN;\n
> local LOAD".

    $ echo $PROMPT_COMMAND
    doPrompt

doPrompt is a shell function that prepares my prompt with a lot of
information (git status, time, battery left...)

I've run a build where PROMPT_COMMAND was missing in the envirnment (but
doPrompt still exists), to no avail. I still get all those numbers...
I did decode all those numbers, and they happen to be exactly the
content of my doPrompt function.

I really wonder what is so strange that rebar chokes on it. Why doe it
even have to look at those, to begin with? :-(

Oh, could that be that doPrompt is exported?

    $ env |grep doPrompt
    PROMPT_COMMAND=doPrompt
    doPrompt=() {  local RET="${?}";

I have this in my .bashrc :

    export -f doPrompt

Hm... I'll try to find some time to run without that in my env...
Yet, it should not choke on it.

> I have two thoughts: first is to try to build with a minimal
> environment just in case rebar is getting confused on something in
> yours (like your prompt settings). The second is to replace the
> version of rebar in ejabberd with the latest and greatest in case they
> fixed it. See https://github.com/rebar/rebar/releases.

I was thinking about the exact same solution, to build our own rebar.

> To be honest, this feels like it's getting above and beyond the level
> of debug that you should have to do.

Well, to be honest, I don't think ejabberd can go in Buildroot at all
for now. It has to do downloads during build time, which is a big
show-stopper IMHO. We currently have no other package that downloads
stuff during the build phase, and for those that usualy do (eg.
tvheadend), we fixed them not to (e.g. to rely on another package, like
dtv-scan-tables.)

And to be further honest, I see Erlang and its ecosystem to be just
completely broken, even more broken than Perl+CPAN (which I do not like
much to start with.)

Yet, I would like to see a Jabber server in Buildroot. I would *love*
that. Hence my persistence in trying to find a solution. But I'm here at
a loss, with no further idea... :-(

> I have some fondness for Erlang,
> so I might try to put in some more time this weekend to figure out
> what's going on.

That'd be great, thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
