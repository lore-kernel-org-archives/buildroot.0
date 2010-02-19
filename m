From: Cameron Hutchison <lists@xdna.net>
Date: Fri, 19 Feb 2010 23:28:06 -0000
Subject: [Buildroot] Add nodes, major, how values are defined?
References: <SNT129-W4523AD7F98DFC8D76EAB00B9460@phx.gbl>
Message-ID: <4bf8.4b7f1e86.3c1b9@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tony Mozi <spooflinux@hotmail.fr> writes:

>The general presentation is : 
># <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
>I do not understand how some points are defined (<major> <minor> <start> <inc>   <count>). 
>Is there a list? Sometimes there is '-', what does it mean?

Not all files created by makedevs needs all the fields. For instance,
directories and files do not use anything from <major> onwards. They are
only used by character and block device nodes. For those file types that
do not use a field, a '-' is used there.

Also, one line in the device_table.txt file can create many sequential
nodes. For example, /dev/mtd0, /dev/mtd1, /dev/mtd2... A line that
creates multiple sequential nodes use the fields <start> <inc> and
<count>. Nodes that are singular (such as /dev/null) do not use these
fields, and will have a '-' in these places. Some lines seem to use 0
instead of '-' - I guess the field is just ignored so it wont matter
what you put there.

This is all described in more detail at the top of
target/generic/device-table.txt. Is there something about that description
that is unclear?
