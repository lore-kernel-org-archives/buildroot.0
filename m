From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 31 Aug 2013 13:59:13 -0400
Subject: [Buildroot] Do if-post-up.d and if-pre-down.d belong in the device
	table?
Message-ID: <CANxTyt6qrfH6ZbVEpJoAJjK50MYhvhez+prXB9LNzZR7ZqgVvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Gustavo,

I was looking into some if-up/down stuff, and stumbled on this commit that
added if-post-up.d and if-pre-down.d to the device_table.txt:

http://lists.busybox.net/pipermail/buildroot/2012-April/053214.html

But in actuality, busybox does not execute scripts from those places.
 Rather, the busybox change was to treat "post-up" and "pre-down" key words
as aliases for "up" and "down", just like the full-blown ifupdown-0.6.16.
 I.e., if you search for the underlying "execute_all" operations in either
busybox-1.21.0/networking/ifupdown.c or in the upstream ifupdown, you will
see that only "pre-up", "up", "down, and "post-down" directory contents are
executed, and that "up" scripts are invoked after the up action has
occurred, and the "down" scripts are run before the down action has
occurred - giving them the roles of "post-up" and "pre-down".

I think having the extra two directories in the device table might mislead
people into thinking that scripts there will be executed.  Or have I
misunderstood something?  For sure, it's not executing scripts from those
places with busybox-1.21.1 ...

FYI, the busybox commit that added the "post-up" and "pre-down" support can
be reviewed at:

http://lists.busybox.net/pipermail/busybox-cvs/2012-April/033401.html


Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130831/def972ea/attachment.html>
