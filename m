From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Aug 2014 23:23:12 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies: Reject gcj in
 BR2_NEEDS_HOST_JAVA check
In-Reply-To: <XnsA388C38E9A3BAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1407356782-3118-1-git-send-email-bernd.kuhls@t-online.de>
 <20140813141110.GF3939@free.fr>
 <XnsA388C38E9A3BAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140813212312.GI3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-13 19:13 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20140813141110.GF3939 at free.fr:
> 
> >> +     JAVA=$(which java 2> /dev/null)
> >> +     if [ -z "$JAVA" ] ; then
> >> +          echo
> >> +          echo "You must install 'java' on your build machine";
> >> +          exit 1;
> >> +     fi;
> >> +     JAVA_GCJ=$($JAVA -version 2>&1 | grep gcj)
> > $ gcj -version
> > gcj: error: unrecognized command line option ???-version???
> > So I guess we should have:
> >     JAVA_GCJ="$(java --version 2>/dev/null |grep gcj)"
> > Which would be empty for the JDK's java, but not for gcj. I prefer we
> > rely on that, rather than the error mesage from gcj.
> 
> Hi,
> 
> $JAVA contains the result of "which java" which is /usr/bin/java here. This 
> corresponds to xbmc/codegenerator.mk, which also calls
> 
> JAVA ?= $(shell which java)
> 
> Executing /usr/bin/gcj directly is not desired ;)
> 
> /usr/bin/java -version resolves to either
> 
> $ /usr/bin/java -version
> java version "1.5.0"
> gij (GNU libgcj) version 4.7.2
> 
> or
> 
> $ /usr/bin/java -version
> java version "1.7.0_65"
> OpenJDK Runtime Environment (IcedTea 2.5.1) (7u65-2.5.1-2~deb7u1)
> OpenJDK 64-Bit Server VM (build 24.65-b04, mixed mode)

OK, so 'java' from gcj accepts the same args as 'java' from the JDK. OK.

So, I still say we should keep the original check, and then check that
java is not from gcj :

    check_prog_host "java"
    if java -version 2>&1 |grep gcj >/dev/null 2>&1; then
        echo "Failed"
        exit 1
    fi

check_prog_host already calls 'which $1' so we're sure we can call 'java'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
