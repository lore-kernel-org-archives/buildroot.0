From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 9 Jul 2013 21:44:27 +0200
Subject: [Buildroot] [PATCH 1/3] qt{4,
 5}: add an explicit choice to express Buildroot does not support
 their coexistence
In-Reply-To: <20130707212335.630a2d32@skate>
References: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
 <CAHXCMMKx-vf9ZFRgzhj_bvYwbb2vHz3qQkC6ebgKqts_-v6-bA@mail.gmail.com>
 <20130707212335.630a2d32@skate>
Message-ID: <CAHXCMMK+bn-J91x0idiMhhLXAmrRt+f8Z_zgzp761EWoR3aTSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

2013/7/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Sun, 7 Jul 2013 21:08:25 +0200, Samuel Martin wrote:
>
>> I forgot to mention that using an explicit choice allow to get rid of
>> the dependency between the
>> Qt4 and Qt5 packages.
>> So, for packages supporting both Qt4 and Qt5 (like OpenCV), it makes
>> possible to handle the
>> right dependency with no circular/recursive dependency in the Config.in files.
>
> Can you give more details about this circular/recursive dependency
> problem?
Sure.

All this work starts with the OpenCV bump, which the latest version
provides support for Qt4
and Qt5.
What I'd like to do at first was:
- if no Qt version was selected beforehand, and one wants to enable Qt
support in OpenCV,
then the Qt version is set via the OpenCV choice;
- if the Qt version is set beforehand, then just allow to enable the
Qt support (no choice, the
one already selected) in OpenCV.

Basically, I tried using a choice; roughly:
---
choice
  prompt "Qt support"

config BR2_OPENCV_WITH_QT_NONE
  bool "none"

config BR2_OPENCV_WITH_QT4
  bool "Qt4"
  depends on !BR2_PACKAGE_QT5
  select BR2_PACKAGE_QT
  ...

config BR2_OPENCV_WITH_QT5
  bool "Qt5"
  depends on !BR2_PACKAGE_QT
  select BR2_PACKAGE_QT5
  ...

endchoice
---


With the current Qt/Qt5 package exclusion mechanism:
---
config BR2_PACKAGE_QT
  ...

config BR2_PACKAGE_QT5
  depends on !BR2_PACKAGE_QT
  ...
---
as you can easily spot, the OpenCV Qt4 support option generate a
circular dependency.


Later, after converting the Qt{4,5} exclusion mechanism to the
proposed explicit choice,
the 'select BR2_PACKAGE_QT{,5}' statements in the OpenCV Qt support
options had no effect,
so I turn them in one unique option, depending on one or the other Qt
version, and selecting
Qt components accordingly.
I think I missed something on this latter issue, but submit it as to
get other people's opinion.


>
> I'm not too enthusiastic about your PATCH 1/3, so I'd like to be sure
> to completely understand what the problem is, and look at the different
> possible solutions.
Hope I'm clear enough.

Regards,

-- 
Samuel
