From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 07 Oct 2013 22:53:34 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <20131007165956.GE9561@free.fr>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <20131007164829.GB9561@free.fr> <20131007165956.GE9561@free.fr>
Message-ID: <2510480.hUTq69UsTb@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 07 October 2013 18:59:56 Yann E. MORIN wrote:
[...]
> I have another interesting idea about such a script: detect whether a
> package overwrites or otherwise modifies a file already existing in
> staging/ and/or target/ to assess for the sanity of the packaging.
I wrote something like this. It is able to track owner of each files of 
target/ and host/. It generates list of owners[1][2]. These list may be 
usefull to generate binary packages. 

I am also able to generate list of overwritten files[3][4]. 

Once I have list of owners in host/, I can track which files are 
accessed during build and compute dependencies between packages[5]. 

As you notice, it is only a proof of concept. There is plenty of false 
positives and I noticed many problems. Especially, current script is not 
very reliable when I launch compilation from a dirty directory. 

It is currently done by launching a daemon which watch target and host 
(using inotify) during each step a built. This daemon log access to 
files and another script post-process it. (I think, I would have far 
better results if I maintain in real time a database of owners of all 
installed files). I may send patches if you are interested (but they are 
a little ugly).


[1] http://sysmic.org/~jezz/instrument/host_owners.gz
[2] http://sysmic.org/~jezz/instrument/target_owners.gz
[3] http://sysmic.org/~jezz/instrument/host_owners.err.gz
[4] http://sysmic.org/~jezz/instrument/target_owners.err.gz
[5] http://sysmic.org/~jezz/instrument/depends

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
