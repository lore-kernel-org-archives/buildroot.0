From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 09:49:20 +0200
Subject: [Buildroot] [PATCH] Revert "dependencies: check that SSL
 certificates are installed"
In-Reply-To: <20130526024707.GA5037@tarshish>
References: <1369031247-2075-1-git-send-email-baruch@tkos.co.il>
 <20130526024707.GA5037@tarshish>
Message-ID: <20130526094920.47aa7434@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 26 May 2013 05:47:07 +0300, Baruch Siach wrote:
> Hi Thomas,
> 
> On Mon, May 20, 2013 at 09:27:27AM +0300, Baruch Siach wrote:
> > This reverts commit d66cd067f3dc3d5e2479e1e8c05f24fd82329f7a.
> > 
> > SSL certificates are no always installed in /etc/ssl/certs. For example, on
> > CentOS 5.6 the default OpenSSL certificates directory is /etc/pki/tls/certs,
> > and wget can download using https without any problem.
> > 
> > Moreover, the existence of /etc/ssl/certs does not guarantee the presence of a
> > CA certificates bundle even on Debian. On my current Debian testing
> > installation the openssl package itself creates an empty /etc/ssl/certs
> > directory.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> 
> As the author of d66cd067f3, what do you think?

Well, d66cd067f3 was written because if you install a very minimal
system, you may not have the SSL certificates installed, which prevents
any download from https:// website. So I added a quick check for that.

However, apparently, the location of such certificates is not fixed
between various systems, so clearly my patch doesn't work properly.

I see two options here:

 (1) Apply your patch, and assume that in most systems, SSL
     certificates are always installed. The case I had what when you
     create a very minimal Debian system, but most people probably use
     a more full-featured system, and it's pretty likely that SSL
     certificates are already installed.

 (2) Replace the test by a test that wget some well-known https:// URL,
     and if it doesn't work, say that SSL certificates are not
     available. But I don't like this too much, because this means that
     at every invocation of 'make', Buildroot will try to download
     something from the network.

So, for now, I believe option (1) is the only viable one, unless there
is some local command that allows to check whether SSL certificates are
installed or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
