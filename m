From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 8 Oct 2016 20:23:09 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
	python
In-Reply-To: <jkhncdxdku.ln2@ID-313208.user.individual.net>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
 <20161008122434.GA3802@free.fr> <20161008145107.277673a8@free-electrons.com>
 <20161008135130.GB3802@free.fr> <20161008160228.71f9e08f@free-electrons.com>
 <jkhncdxdku.ln2@ID-313208.user.individual.net>
Message-ID: <CAGm1_kv=SFf1jZ=O+JAOiqL9e+_WtQ=UpxeTbX2AQayntH8BaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 8, 2016 at 5:57 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Hi Thomas, hi Yann,
>
> Am Sat, 08 Oct 2016 16:02:28 +0200 schrieb Thomas Petazzoni:
>
>>> Plain and simple: if a python module supports both python and python3,
>>> and both are enabled, that python module is built for both python and
>>> python3.
>>
>> Well, that's horrible from a filesystem size point of view, and I'm not
>> really sure this would solve Bernd's issue. I'm pretty sure Bernd would
>> like to have a given set of modules built for Python 2, and another set
>> of modules built for Python 3.
>
> actually I solved the dependency problem by copying python2 and python3
> to my target system ;) This is possible for me because I do not use a
> filesystem created by buildroot but use files from output/target/ stored
> as optional packages for the fli4l project, which then creates the
> filesystem image for the target machine by including these packages.
>
> To achieve this I am building with one .config which has python2 + kodi/
> mwscrape and later another .config build is done with python3 +
> mwscrape2slob.
>
> To clarify:
> mwscrape[1] downloads articles from mediawiki-based sites, stores them on
> a couchdb server and has runtime dependencies to the following python
> modules: couchdb, futures, mwclient and pylru. Because mwclient is
> python2-only so is mwscrape.

isn't mwclient Python 3 compatible? See [1]

[1] https://github.com/mwclient/mwclient/blob/master/setup.py#L48

Yegor

> mwscrape2slob[2] downloads the stored mediawiki articles from the couchdb
> server and creates files in .slob format for use in the Android app aard2
> [3], which is a offline-reader. It depends on the following python
> modules: couchdb, cssselect, cssutils, lxml and slob. The modules slob
> and mwscrape2slob are python3-only.
>
> Luckily no module with a python version restriction depends on a module
> with a different python version restriction :)
>
> So yes, there are some modules which I only need in python2, others only
> in python3, for this purpose I am using two different .config files and
> build python2 and python3 seperately. Filesystem space is not a problem
> for me, my target system is not an embedded device, therefore my solution
> may not be suitable for the general use in the buildroot project.
>
> I expect to send the mwscrape2slob patch series in the coming days after
> testing a self-build .slob file. Currently I am busy with downloading
> Wikipedia data ;) The CouchDB server built with buildroot runs rock-solid.
>
> Regards, Bernd
>
> [1] https://github.com/itkach/mwscrape
> [2] https://github.com/itkach/mwscrape2slob
> [3] https://github.com/itkach/aard2-android
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
