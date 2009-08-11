From: Eric Malkowski <eric@bvwireless.net>
Date: Tue, 11 Aug 2009 13:54:40 -0400
Subject: [Buildroot] BIND 9.5.1 startup fails w/ IPv6 disabled - PATCH to
 fix built-in root hints
Message-ID: <4A81B060.2030902@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all-

When you guys went to BIND 9.5.1_P2 and P3 for kaminsky and dynamic 
update DoS fixes, the ISC folks added compiled-in root hints that get 
loaded before any other zones (including user specified root hints) and 
when IPv6 is disabled via buildroot option (my setup is this way), BIND 
will fail to start complaining that the IPv6 AAAA addresses in the built 
in root hints are invalid.  The error is right after the server outputs 
"setting up root hints" and it complains "2001:503:BA3E::2:30 bad IPv6 
address"

My solution is attached as a patch against BIND 9.5.1_P3 that simply 
puts #ifdef WANT_IPV6 around the AAAA addrs in the built in table and 
now bind starts fine and appears to work fine on an IPv4 only buildroot 
setup.

It's up to you guys if you want to commit the patch to git.  I'm 
attaching w/ my Thunderbird e-mail client, hopefully it won't botch the 
patch, if so let me know what other ways I can submit the patch.

Thanks -- and hope this helps someone out, I spent too many hours trying 
to figure this one out and wanted to at least report it somewhere in 
case someone else is googling like mad trying to find an answer.

-Eric Malkowski

-------------- next part --------------
A non-text attachment was scrubbed...
Name: bind-fix-ipv6-hints.patch
Type: text/x-patch
Size: 1907 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090811/7f355aca/attachment.bin>
