From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 23:09:43 +0200
Subject: [Buildroot] [PATCH 02/11] ejabberd: simplify init script by
 patching ejabberdctl
In-Reply-To: <CAJtjsKZeXXQvGimN=Zq1gdPLSwX5LY1J=Jh0J9L8SYwBK6y9XQ@mail.gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
 <1436349264-11797-3-git-send-email-johan.oudinet@gmail.com>
 <20150711123051.664507d5@free-electrons.com>
 <CAJtjsKZeXXQvGimN=Zq1gdPLSwX5LY1J=Jh0J9L8SYwBK6y9XQ@mail.gmail.com>
Message-ID: <20150719230943.1f63c757@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

On Tue, 14 Jul 2015 11:52:41 +0200, Johan Oudinet wrote:

> > So this makes the patch Buildroot specific. Why isn't the
> > {{installuser}} properly replaced by the "right" value at install time?
> 
> If we define the installuser variable, then the Makefile try to chmod
> files with this user, which does not necessarily exist in the host
> system. Debian packaging of ejabberd does the same trick to not set
> the installuser variable and patch the ejabberdctl instead. In the
> last buildroot version of ejabberd, each call of ejabberdctl was
> prefixed by "su ejabberd -c", which is less convenient than fixing
> INSTALLUSER to ejabberd.
> If you prefer, I could modify this variable in a post-build hook.

Ok, thanks for the additional explanation. The proposal you made works
for me, especially since Debian is doing the same.

> > I don't really understand why we are loading this default file here and
> > in the init script itself. Who is installing this /etc/default/ejabberd
> > file? What does it contain?
> 
> I like shell scripts that read a configuration files in /etc/default
> so one can modify the script behavior without modifying it.

Me too. What was confusing me is that both the init script *and* the
ejabberdctl script were reading it. But you gave some good explanation
for that.

> > This change doesn't seem to be related.
> 
> Which one? Using $CTL instead of ctl because we removed the ctl
> function or try to start the service even if stop failed?
> I agree that the second one is not related to the simplification of
> the init script. Should I split it in another commit?

The change to start the service even if the stop failed. But that's
a minor detail.

Therefore, I've applied the patch as is. Thanks again for this
contribution and the additional explanations!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
