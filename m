From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 30 Nov 2017 14:53:04 +0100
Subject: [Buildroot] [PATCH 1/1] Add TCF Agent package
In-Reply-To: <20171130135004.54a455c9@windsurf.home>
References: <20171114145442.16734-1-norbert.lange@andritz.com>
 <20171129224524.1f8022b4@windsurf.home>
 <CADYdroOSHBypUB1gDLZxDptrvmKG1QeqBRuQTFcg_ZwqJC9zhg@mail.gmail.com>
 <20171130135004.54a455c9@windsurf.home>
Message-ID: <CADYdroPF2bBTL4TpLDC6XyNSYFy642QWHA5DuyEy73qomJNpGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-11-30 13:50 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> It would be nice if you could avoid top-posting. Replying below each
> part of the e-mail you're answering is much more readable, and is the
> common practice on the mailing lists of open-source projects.

Ok noted.

>> -   drop CMake....
>> I am considering dropping the use of CMake (there s alot deduced
>> automatically, by changing the name you got to redo all of that
>> manually)
>> and using the plain Makefile, this seems like less hassle in the end,
>> but that means some additional stuff will be installed.
>
> Hum, I don't think I suggested dropping CMake. I'm all in favor of
> using standardized build systems such as CMake. What about just
> patching the CMakeLists.txt to build a binary named tcf-agent instead
> of agent? With a proper explanation, this should be acceptable by the
> upstream tcf-agent developers.

You did not suggest it, I am thinking about the best way to build it.
The package comes both with CMake and GNUMake files, both with their issues,
GNUMake is more complete as it installs headers and init script.

I cant easily rename the executable target, as there is already a target
named "tcf-agent" for the library. I dont want to work around that
limitation, as in my experience, as soon as you start circumventing
the CMake automechanics you never stop.
"tcf-agent" is the commonly referred executable name btw.

>
>> It there any common way to do this install step in an temp dir and
>> then (re)moving files before copying this into the final target fs?
>
> Nope, we don't have such a possibility currently I'm afraid.

Ok, gonna need some tinkering time, especially after looking more
closely into the (C)Make files. I found some goodies like

  if(NOT TCF_MACHINE)
    set(TCF_MACHINE "x86_64")
  endif()

which means currently other architectures will have some funny
disassembler and debugging-services...
Possible values are "a64  arm  i386  i686  powerpc  ppc64  x86_64", gonna
map this from the Buildroot variables somehow.

Also, if the package *optionally* links to eg. libssl if available,
then I would add this only in
TCFAGENT_DEPENDENCIES += openssl ?

Norbert
