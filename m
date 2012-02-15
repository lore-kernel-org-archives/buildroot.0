From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 15 Feb 2012 19:15:00 +0100
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAPeX=+s407S8aNwEZnKD4UAzJjR15-+juPYrJdXR+T4sEg6wEQ@mail.gmail.com>
References: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
 <CAPeX=+ubBEJeR9s+gH8ACDpUToXLA_rDqDwL4NT44BZ-PsfFsA@mail.gmail.com>
 <CAHXCMMKLFopuH8ubCnaY2_1oKkXf-wXHmzV_Fvo77NAutCKOcw@mail.gmail.com>
 <CAPeX=+s407S8aNwEZnKD4UAzJjR15-+juPYrJdXR+T4sEg6wEQ@mail.gmail.com>
Message-ID: <CAHXCMM+_TrnpuCA6C_8MbVkd1gyZLBmJ3kihufb-5snLguUs_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/2/15 Ozgun <ozgun.gunay@gmail.com>:
>
> I can compile with glibc library without any problem. But when I choose/add
> opencv, buildroot installs CMAKE to TARGET just before opencv and then CMAKE
> try to configure opencv, meanwhile CMAKE assumes uclibc.
> I changed? CMAKETARGET? to AUTOTARGETS then buildroot give ./configure file
> is not exist.
> I understand that opencv has a special configuration management system via
> CMAKE, and CMAKE has some problems with crosstool-ng toolchain.
>

Actually opencv is a cmake target, you cannot (easily) change that !
Cmake is the alternative to the autotools used by opencv.

The problem is that BR generate the output/toolchainfile.cmake that
describe the toolchain you're currently using,
But unfortunately, this file is wrong, it does not match your current
toolchain; it cerlainly one of your previous configuration.

So, removing output/toolchainfile.cmake will make BR regenerate it
according to the current configuration during the next build.
Then, when cmake will be called to configure opencv, the
toolchainfile.cmake passed as argument will be correct.
