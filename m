From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:34:52 +0200
Subject: [Buildroot] [git commit] package/meson: fix empty arguments in
 cross-compilation.conf
In-Reply-To: <20190701080441.3B93882108@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 1 Jul 2019 09:49:42 +0200")
References: <20190701080441.3B93882108@busybox.osuosl.org>
Message-ID: <875zoecpyr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e9de6d9e0ac66883b9c8b7b4c623b27dab8087ab
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When TARGET_CFLAGS (or _LDFLAGS or _CXXFLAGS) are empty, but were
 > constructed by appending other variables, like:

 >     TARGET_CFLAGS = $(SOMETHING) $(SOMETHING_ELSE)

 > and both variables are empty, then $(TARGET_CFLAGS) is _not_ the
 > null-string; it's value is a string made of a single space.

 > This means that the construct:

 >     $(if $(TARGET_CFLAGS),true,false)

 > will in fact return 'true'.

 > In our case, it means that we will call:

 >     `printf '"%s", ' `

 > which expands to just:

 >     "",

 > which we are then happy to insert as-is in the generated
 > cross-compilation.conf.

 > Then meson, will happily call the compiler with an empty argument.

 > The compiler is less happy, though:

 >     arm-none-linux-gnueabi-gcc: error: : No such file or directory

 > And this is not even trivial to debug either... The only clue being that
 > there seems to be something missing between ': :'

 > We fix that testing the $(strip)ed value. We can still pass the
 > non-$(strip) expansion, because the shell will just do it for us, and we
 > are then sure there is at least one non-blank word in there.

 > Thanks a lot to Adam for his invaluable help debugging this!

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
