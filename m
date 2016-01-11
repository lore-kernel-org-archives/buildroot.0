From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 10:49:18 +0100
Subject: [Buildroot] Persistent dropbear keys
In-Reply-To: <CAAXf6LUt+aNoD+JWABzdjnQ5DAP3UO9DYFHXKjqkj49jo+d0Jw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 11 Jan 2016 09:56:00
 +0100")
References: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
 <87mvsgdkxy.fsf@dell.be.48ers.dk>
 <CAAXf6LUt+aNoD+JWABzdjnQ5DAP3UO9DYFHXKjqkj49jo+d0Jw@mail.gmail.com>
Message-ID: <8737u4bg4h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

>> Why don't you just make /etc/dropbear a symlink to your persistent
 >> medium?

 > While I had not thought of that when designing my current solution,
 > doing that without additional checking can be a problem: if the key on
 > the persistent storage gets corrupted somehow, new connections would
 > no longer be possible. I.e. make a small change in the existing key in
 > /etc/dropbear, restart dropbear, and connection attempts fail with
 > following syslog entry:

 > Jan  3 06:41:58 hostname authpriv.info dropbear[14789]: Exit before
 > auth: Couldn't read or generate hostkey
 > /etc/dropbear/dropbear_rsa_host_key

Yeah :/

 > Just like with my current solution that actually copies the keys
 > (rather than symlinking) I think you need to verify the keys
 > before/after reboot, using dropbearkey. However, the symlink solution
 > has the disadvantage in this case that an unexpected reboot (without
 > the additional key check) potentially results in a corrupted key in
 > /etc/dropbear, while the copy solution will only copy validated keys
 > (during controlled reboot).

First of all, it is important to understand why these files might get
corrupted, E.G. what kind of issue you try to work around. Dropbear used
to have problems, but afaik does the correct fsync / rename dance to
safely create these files since 2015.67:

https://github.com/mkj/dropbear/commit/4ba830fc31c056aaada774ce29bb7d4e136b5dcd

But that naturally still relies on a working fs / block device. Is this
your concern or something else?

With the fix in 2015.67 I haven't seen corrupted host keys any more in
the projects I work on, and for the use cases we have that is good
enough (E.G. ssh is not a feature accessible to end users, and our
factory reset button throws away the /etc overlay, so this could be used
to fix corrupted host keys if needed).

-- 
Venlig hilsen,
Peter Korsgaard 
