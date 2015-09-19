From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:40:17 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <20150913213513.GA21306@free.fr>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <20150913232942.736dea75@free-electrons.com>
 <20150913213513.GA21306@free.fr>
Message-ID: <20150919144017.4fdcc90a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Sep 2015 23:35:13 +0200, Yann E. MORIN wrote:

> > Do we actually understand why it doesn't work? There is really no
> > reason for .py files to be necessary.
> 
> Well, what do I know about python? ;-)
> 
> I never said I understood the issue. Just that having only .pyc modules
> make Kodi segfault, while having .py makes it work... :-(
> 
> All I got was the trace above. There was nothing (of interest) in Kodi's
> own log file.

As you can imagine, I'm not too happy with this solution. I believe
Kodi is doing something incorrect, since if you just run Python with
the .pyc files, and do "import site", it works just fine.

There is some logic in Kodi that tries to set the PYTHONHOME
environment variable. Can you see in the logs if you see the following
messages (from xbmc/interfaces/python/XBPython.cpp) :

  CLog::Log(LOGINFO, "initializing python engine.");
  CLog::Log(LOGDEBUG, "PYTHONHOME -> %s", CSpecialProtocol::TranslatePath("special://frameworks").c_str());
  CLog::Log(LOGDEBUG, "PYTHONPATH -> %s", CSpecialProtocol::TranslatePath("special://frameworks").c_str());

Alternatively, can you change Python, in file Modules/getpath.c,
function calculate_path(), and dump all the environment variables?

I could do it myself, but Kodi is so long to build... :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
