From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Thu, 24 Mar 2011 15:19:53 -0400
Subject: [Buildroot] sshd and password problem
Message-ID: <1D6034426110564DA0DEA9EE9793B3835817820906@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I added OpenSSH to my top level menuconfig in Buildroot. When I brought
the platform up I tried to 'ssh' to the target. But each time I tried to
login to the target, ssh would always force me to change my password, and then 
close the connection. 

heyendal at ubuntu1-carlh:~$ ssh carlh at 192.168.52.190
carlh at 192.168.52.190's password: 
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for carlh
Old password: 
New password: 
Retype password: 
Password for carlh changed by carlh
Connection to 192.168.52.190 closed.
heyendal at ubuntu1-carlh:~$ ssh carlh at 192.168.52.190
carlh at 192.168.52.190's password: 
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for carlh
Old password: 
New password: 
Retype password: 
Password for carlh changed by carlh
Connection to 192.168.52.190 closed.

Despite my problem with ssh I could always login through a console without any 
problems.

So I investigated the format of the shadow file and noticed that the 'days since
last password changed' was set to '0' for my account and for root. However all 
the other entries in the shadow file had a substantial value for that field, 
and all being the same value (10933). 

root:[deleted field]:0:0:99999:7:::
bin:*:10933:0:99999:7:::
daemon:*:10933:0:99999:7:::
adm:*:10933:0:99999:7:::
lp:*:10933:0:99999:7:::
sync:*:10933:0:99999:7:::
shutdown:*:10933:0:99999:7:::
halt:*:10933:0:99999:7:::
uucp:*:10933:0:99999:7:::
operator:*:10933:0:99999:7:::
nobody:*:10933:0:99999:7:::
default::10933:0:99999:7:::
carlh:[deleted field]:0:0:99999:7:::


So I changed the same field for my account and for root from 0 to 10933 
and voila, it fixed the problem with ssh.

Is this a bug with ssh looking at an incorrect field? Is there some other 
build setting I should have done to prevent the problem?

thanx
/carl
