From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 23 Jun 2010 14:48:14 +0200
Subject: [Buildroot] Host libraries - status
In-Reply-To: <20100623131800.35b2189f@surf>
References: <201006230045.23043.yann.morin.1998@anciens.enib.fr>
	<20100623112022.4bb9cab0@surf> <20100623131800.35b2189f@surf>
Message-ID: <201006231448.15070.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 23 June 2010 112022 Thomas Petazzoni wrote:
> So, I decided to try :
> HOST_LDFLAGS += -rpath $(HOST_DIR)/usr/lib
> unfortunately, it breaks host-genext2fs, because this stupid guy passes
> those LDFLAGS directly to gcc :

Unfortunately, genext2fs is not the only sucker in this category. A lot
of packages happen to use gcc as the frontend to ld, and mis-interpret
things such as --fatal-warnings

On Wednesday 23 June 2010 131800 Thomas Petazzoni wrote:
> With this + the HOST_LDFLAGS as shown above, my mkfontscale test case
> is OK, and fakeroot continues to work properly. I managed to build a
> X.org stack + ext2 filesystem for ARM correctly.

Hmm... That's great news, then!

I dwelved into it yesterday evening^Wnight, but mostly from a theoretical
point of view. That is, I googled for such errors. :-/



> Generally speaking, I think we shouldn't do:
>                 CC="$(HOSTCC) $(HOST_CFLAGS)" \
>                 GCC="$(HOSTCC) $(HOST_CFLAGS)" \
>                 CXX="$(HOSTCXX) $(HOST_CXXFLAGS)" \
>                 CPP="$(HOSTCPP) $(HOST_CFLAGS)" \
> But only set CC="$(HOSTCC)", and pass CFLAGS in a separate variable.

Ditto for GCC, GXX, CPP and LD, I guess. And ./configure just does honor the
CPPFLAGS, CFLAGS, CXXFLAGS and LDFLAGS if given in the environmanet and/or
on the command line, IIRC.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
