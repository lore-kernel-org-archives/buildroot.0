From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Feb 2016 18:19:40 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask
 to umask.sh
In-Reply-To: <20160208172509.2e68a8ba@free-electrons.com>
References: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20160208172509.2e68a8ba@free-electrons.com>
Message-ID: <20160208171940.GA3436@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-02-08 17:25 +0100, Thomas Petazzoni spake thusly:
> On Mon,  8 Feb 2016 16:42:45 +0100, Nicolas Cavallari wrote:
> > /etc/profile only sources files that matches the /etc/profile.d/*.sh
> > pattern, so /etc/profile.d/umask was never sourced.
> > 
> > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> > ---
> >  system/skeleton/etc/profile.d/{umask => umask.sh} | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename system/skeleton/etc/profile.d/{umask => umask.sh} (100%)
> > 
> > diff --git a/system/skeleton/etc/profile.d/umask b/system/skeleton/etc/profile.d/umask.sh
> > similarity index 100%
> > rename from system/skeleton/etc/profile.d/umask
> > rename to system/skeleton/etc/profile.d/umask.sh
> 
> I'd rather think that /etc/profile should source all files
> in /etc/profile.d/. At least that's what I would expect from a
> <something>.d/ directory.
> 
> What do others think about this?

The *.sh is customary on standard distros. So I'd keep it named as thus
so users are not surprised that we include things that would not have
been included.

The reasoning behind this is that a Bourne-compliant (aka POSIX) shell
would parse only the *.sh scripts, which ought to Bounre-compliant,
leaving aside other scripts for the other shells (like csh, which is not
Bourne-compliant but may still scan files from /etc/profile.d with a
pattern not-unlike *.csh).

Furthermore, as the (other) Thomas pointed out, we do not want to source
any stray (backup) file (even though I'd argue that the user should be
responsible for cleaning up that location before generating the image,
but that leaves local edits as a possible source of confusion).

So, I prefer that we only source /etc/profile.d/*.sh because of the
aforementioned reasons, i.e.;
  - Bourne/POSIX-compliant scripts
  - principple of least-surprise

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
