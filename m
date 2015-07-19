From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 19 Jul 2015 08:44:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: Add patch to fix
 OPEN_MAX build error
In-Reply-To: <20150718143642.7ae447e3@free-electrons.com>
References: <1437079992-31679-1-git-send-email-joerg.krause@embedded.rocks>
 <20150718143642.7ae447e3@free-electrons.com>
Message-ID: <1437288275.12715.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sa, 2015-07-18 at 14:36 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu, 16 Jul 2015 22:53:12 +0200, J?rg Krause wrote:
> 
> > ++#ifndef OPEN_MAX
> > ++#define OPEN_MAX 256 /* Guess */
> > ++#endif
> > ++
> 
> This is not the right fix. There is some Linux-specific code in
> closefrom.cpp, but it doesn't get used since when you build C++ code
> with -std=c++0x, the compiler doesn't define "linux" or "__linux", 
> but
> "__linux__", so the following test doesn't work anymore:
> 
> #elif (defined(linux) || defined(__linux))
> 
> See what the compiler does, without -std=c++0x:
> 
> $ ./output/host/usr/bin/powerpc-linux-g++ -dM -E - < /dev/null | grep 
> -i linux#define __linux 1
> #define __linux__ 1
> #define __gnu_linux__ 1
> #define linux 1
> 
> And now, with -std=c++0x:
> 
> $ ./output/host/usr/bin/powerpc-linux-g++ -std=c++0x -dM -E - < 
> /dev/null | grep -i linux
> #define __linux__ 1
> #define __gnu_linux__ 1
> 
> So, just change the closefrom.cpp Linux test to:
> 
> #elif (defined(linux) || defined(__linux) || defined(__linux__))
> 
> and it will build fine, and be a lot better than a guessed 256 value.
> Can you submit a new patch that does this, and report the proper
> solution upstream?

I see! You're right, it works. I'll submit a new patch.

Best regards
J?rg Krause
