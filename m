From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 13:11:10 +0100
Subject: [Buildroot] Persistent dropbear keys
In-Reply-To: <CAAXf6LWOC6O3eCX_AH=0hRrGqP0hcnsaJEMDnOV4Tu-5vP-aJw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 13 Jan 2016 09:16:45
 +0100")
References: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
 <87mvsgdkxy.fsf@dell.be.48ers.dk>
 <CAAXf6LUt+aNoD+JWABzdjnQ5DAP3UO9DYFHXKjqkj49jo+d0Jw@mail.gmail.com>
 <8737u4bg4h.fsf@dell.be.48ers.dk>
 <CAAXf6LWOC6O3eCX_AH=0hRrGqP0hcnsaJEMDnOV4Tu-5vP-aJw@mail.gmail.com>
Message-ID: <874meg2wf5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

>> With the fix in 2015.67 I haven't seen corrupted host keys any more in
 >> the projects I work on, and for the use cases we have that is good
 >> enough (E.G. ssh is not a feature accessible to end users, and our
 >> factory reset button throws away the /etc overlay, so this could be used
 >> to fix corrupted host keys if needed).

 > While we haven't seen corrupted host keys in real life (but apparently
 > you did already), I think it is a good safety precaution to take it
 > into account. The fix in dropbear you refer to is very recent, so up
 > until now there was anyway a good reason to not use a direct symlink
 > /etc/dropbear -> /persistent/something.

I've seen empty (not corrupted data) key files from the missing fsync,
yes.

Yes, the fix is quite recent, but the feature to let dropbear
automatically generate the keys is also relatively new (2013.62).


 > But even with this fix, how much guarantee can you give that there is
 > not another bug in dropbear or the filesystem, or a script of our own
 > for that matter, that would inadvertently change the file or cause
 > some kind of corruption in it?

Guarantees are hard to come by ;) Now, the code that writes the file is
fairly small and self contained, but with a writable /etc you could
indeed conceptually have all kinds of problems (not limited to dropbear
keys).


 > In our case, these boxes are 'out there' (and this can be in the
 > middle of a city or the middle of the desert). In case of trouble, SSH
 > access is the sole practical connection available and as such it needs
 > to be reliable. The alternative is having a technician driving to the
 > box, either attaching a serial connection or simply replacing the box
 > and sending the 'bad' one to skilled people. In either case, this is a
 > very expensive operation that should be avoided as much as possible.

Yes, like just about anything in engineering, it is a matter of
tradeoffs - And different projects may need different solutions.

The solution you describe is certainly fine. As I mentioned, I'm
currently using a reset-to-factory-defaults button in case stuff really
get corrupt. Other solutions I've used are:

- Generate / install (ssh keys, TLS certificates, ..) data once during
  production flow and write this to a file system. In operation this
  file system is always mounted read only.

- Prebake SSH keys in (RO) rootfs (!).

And I'm sure there's others as well.

-- 
Venlig hilsen,
Peter Korsgaard 
