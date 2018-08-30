From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 30 Aug 2018 16:09:57 +0200
Subject: [Buildroot] mkusers removes existing users from groups in
 system/skeleton/etc/groups
Message-ID: <CAJtjsKZpaa+5enCzfQD7VBk3pOBu3yXehSHx4LgFC+6uDA0H+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was trying to add a new group with an existing user in it. I added
the following line to system/skeleton/etc/group:
ssl-cert:x:101:www-data

I have packages that add other users to this group, let say package A
and B, with users user-a and user-b, respectively.

At the end, the group file in output/target contains the following line:
ssl-cert:x:101:user-a,user-b

So, no more www-data user in the ssl-cert group :-(

I dig into the scripts to find out that the function add_one_group in
the mkusers script is called for every group mentioned in the user
table. It deletes the group then creates one without any user in it
:-/

Unfortunately, this script is called after the post-build scripts. So
I have no way to re-introduce the www-data user afterwards :-(

Do you know why this function ignores the existing users in a group?

-- 
Johan
