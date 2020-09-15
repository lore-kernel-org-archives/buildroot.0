From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 19:48:15 +0200
Subject: [Buildroot] [PATCH] package/zeromq: security bump to version
 4.3.3
In-Reply-To: <20200908205315.6706-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 8 Sep 2020 22:53:15 +0200")
References: <20200908205315.6706-1-peter@korsgaard.com>
Message-ID: <87tuvzue1s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-15166: Denial-of-Service on CURVE/ZAP-protected servers by
 >   unauthenticated clients.
 >   If a raw TCP socket is opened and connected to an endpoint that is fully
 >   configured with CURVE/ZAP, legitimate clients will not be able to exchange
 >   any message.  Handshakes complete successfully, and messages are delivered
 >   to the library, but the server application never receives them.  For more
 >   information see the security advisory:
 >   https://github.com/zeromq/libzmq/security/advisories/GHSA-25wp-cf8g-938m

 > - Stack overflow on server running PUB/XPUB socket (CURVE disabled).
 >   The PUB/XPUB subscription store (mtrie) is traversed using recursive
 >   function calls.  In the remove (unsubscription) case, the recursive calls
 >   are NOT tail calls, so even with optimizations the stack grows linearly
 >   with the length of a subscription topic.  Topics are under the control of
 >   remote clients - they can send a subscription to arbitrary length topics.
 >   An attacker can thus cause a server to create an mtrie sufficiently large
 >   such that, when unsubscribing, traversal will cause a stack overflow.  For
 >   more information see the security advisory:
 >   https://github.com/zeromq/libzmq/security/advisories/GHSA-qq65-x72m-9wr8

 > - Memory leak in PUB server induced by malicious client(s) without CURVE/ZAP.
 >   Messages with metadata are never processed by PUB sockets, but the
 >   metadata is kept referenced in the PUB object and never freed.  For more
 >   information see the security advisory:
 >   https://github.com/zeromq/libzmq/security/advisories/GHSA-4p5v-h92w-6wxw

 > - Memory leak in client induced by malicious server(s) without CURVE/ZAP.
 >   When a pipe processes a delimiter and is already not in active state but
 >   still has an unfinished message, the message is leaked.
 >   For more information see the security advisory:
 >   https://github.com/zeromq/libzmq/security/advisories/GHSA-wfr2-29gj-5w87

 > - Heap overflow when receiving malformed ZMTP v1 packets (CURVE disabled).
 >   By crafting a packet which is not valid ZMTP v2/v3, and which has two
 >   messages larger than 8192 bytes, the decoder can be tricked into changing
 >   the recorded size of the 8192 bytes static buffer, which then gets
 >   overflown by the next message.  The content that gets written in the
 >   overflown memory is entirely decided by the sender.
 >   For more information see the security advisory:
 >   https://github.com/zeromq/libzmq/security/advisories/GHSA-fc3w-qxf5-7hp6

 > Drop now upstreamed patches, autoreconf and reformat hash file with 2 space
 > delimiters.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
