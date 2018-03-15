From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 15 Mar 2018 23:55:01 +0100
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
Message-ID: <1521154501.16532.15.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am facing an issue with busybox init system, bash and mdev. When a
bash script uses process substitution, bash ends with an error:

   """
   # bash -c 'read x< <(echo 1); echo $x'
   bash: /dev/fd/62: No such file or directory
   """

The issue is addressed is some threads, e.g. [1]. The problem is that
/dev/fd does not exist when using mdev:

   """
   # ls -l /dev/fd
   ls: /dev/fd: No such file or directory
   """

As addressed here [2], the issue can be fixed by adding:

   """
   ln -snf /proc/self/fd /dev/fd
   """

... to /etc/inittab or /etc/init.d/S10mdev:

   """
   # ls -l /dev/fd
   lrwxrwxrwx    1 root     root            13 Mar 15 22:39 /dev/fd -> /proc/self/fd
   # ls -l /dev/fd/
   total 0
   lrwx------    1 root     root            64 Mar 15 22:40 0 -> /dev/pts/0
   lrwx------    1 root     root            64 Mar 15 22:40 1 -> /dev/pts/0
   lrwx------    1 root     root            64 Mar 15 22:40 2 -> /dev/pts/0
   ls: /dev/fd/3: cannot read link: No such file or directory
   lr-x------    1 root     root            64 Mar 15 22:40 3
   """

The process substitution works now as expected:

   """
   # bash -c 'read x< <(echo 1); echo $x'
   1
   """

I found some other threads which additionally add the following lines:

   """
   ln -snf /proc/self/fd/0 /dev/stdin
   ln -snf /proc/self/fd/1 /dev/stdout
   ln -snf /proc/self/fd/2 /dev/stderr
   """

... as /dev/std{in,out,err} do not exist when using mdev

My question is how to best fix this issue in Buildroot? Any
suggestions?

[1] http://gnu-bash.2382.n7.nabble.com/dev-fd-62-No-such-file-or-directory-td13233.html
[2] https://bugs.alpinelinux.org/issues/1465

Best regards
J?rg Krause
